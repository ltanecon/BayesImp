Imputation_Method <- function (df, par = NULL, standard = 1, rank_based = 1, Bayesian = 1, select = NA, prior.grid = 50, rtol = 1e-11){

  if (standard+rank_based+Bayesian == 0) stop("Choose at least one method")

  # standard method

  if (length(par)==0) par <- GB2MLE(df)

  standard_imp <- function(s){

    tempf <- df$income[s]

    if (df$Type[s] > 1){

      tempf <- 0
      i <- as.numeric(df$wave[s])
      while ((tempf <= df$top.threshold[s]) | (tempf == Inf)) {tempf = rgb2(1,par[[i]][1],par[[i]][2],par[[i]][3],par[[i]][4])}

    }

    tempf

  }

  df$standard <- sapply(df$seq_id,FUN=standard_imp)

  if (rank_based+Bayesian == 0) return(df)

  # rank-based method

  resid <- lm(standard ~ wave, data = df, weights = weight)$residual
  df$mean_resid <- ave(resid,df$id,FUN=mean)
  df_top <- df[which(df$Type>1),]
  df_top <- transform(df_top, rank = ave(mean_resid, wave, FUN = function(x) rank(-x, ties.method = "random")))

  df_top$rank_based <- 0

  for (i in unique(df_top$wave))
    df_top$rank_based[df_top$wave==i] <- sort(df_top$standard[df_top$wave==i], decrea=TRUE)[df_top$rank[df_top$wave==i]]

  df <- df[ , !(names(df) %in% c("mean_resid"))]

  df$rank_based <- df$income
  df$rank_based[which(df$Type>1)]<-df_top$rank_based

  if (standard == 0) df <- df[ , !(names(df) %in% c("standard"))]
  if (Bayesian == 0) return(df)

  # Bayesian method
  # ---prior estimation

  bn <- lm(rank_based ~ wave, data = df, weights = weight)

  df$resid <- bn$residual/df$CPI
  df$pdt <- bn$fitted.values
  rm(bn)

  count <- ave(rep(1,length(df$id)),df$id,FUN=sum)
  if (is.na(select)) select <- max(count)
  df2 <- df[which(count >= select),]

  prior_estmiate <- function(data) {

    y = data$resid
    id = data$id
    t <- mean (data$weight)
    w = data$weight/t
    A = cbind(y,id,w)
    A = A[!is.na(y),]
    y = A[,1]
    id = A[,2]
    w <- A[,3]

    cl1 <- prior.grid + 1

    m <- aggregate(y~id,A,FUN="var")$y

    f = WGLVmix(y,id,w, u = cl1, v = cl1, rtol = rtol,verb = 1)

    f$fuv <- pmax(0,f$fuv)

    f

  }

  f <- prior_estmiate(df2)

  # ---posterior formation

  posterior <- function(individual_income,f,n){

    indi_mean <- mean(individual_income)
    indi_var <- var(individual_income)
    l <- length(individual_income)
    l2 <- (l-1)/2
    l3 <- length(f$u)*length(f$v)

    temp <- l2*indi_var/f$v
    est_v <- exp(-temp)*temp^l2/indi_var/gamma(l2)
    est_u <- t(dnorm(outer(sqrt(l)*(indi_mean-f$u),sqrt(f$v),"/")))/sqrt(f$v) * sqrt(l)

    posts <- pmax(matrix(est_u * est_v,1, l3) * f$fuv,0)
    posts <- posts/sum(posts)

    expand.grid(theta = f$v, alpha = f$u)[sample(l3, n, prob = posts, replace = TRUE),]

  }

  postsummary <- function(data, ids, fit, pn, pm){
    y <- data$resid
    id <- data$id
    ndi <- data.frame(id = id, y = y)
    ndi = ndi[!is.na(y),]
    ndi <- ndi[ndi$id == ids,]

    if (nrow(ndi) <= 2) {
      temp <- sample (1:length(fit$fuv),pn,prob=fit$fuv,replace=T)
      x <- fit$v[(temp-1) %% length(fit$v)+1]
      y <- fit$u[(temp-((temp-1) %% length(fit$v)+1))/length(fit$v)+1]
      G <- matrix(c (x,y),pn,2)
    }
    if (nrow(ndi) > 2) {
      G <- posterior(ndi$y, f, 2000)
    }
    Y <- matrix(0, pm, pn)
    for(j in 1:pn) Y[,j] <- rnorm(pm, mean = G[j,2], sd = sqrt(G[j,1]))

    Y
  }

  # ---finalize imputation

  df_top <- df[which(df$Type>1),]

  df_top$eid <- 1:nrow(df_top)

  df_top$Bayesian <- 0

  for (j in unique(df_top$id)){
    temps <- df_top[which(df_top$id==j),]
    temp <- postsummary (data = df, ids = j,fit = f, pm = nrow(temps), pn = 2000)

    for (m in 1:2000){
      temps$Bayesian <- temp[,m]*temps$CPI+temps$pdt
      flag <- prod(temps$Bayesian>=temps$top.threshold)
      if (flag) break
      if (m == 2000) temps$Bayesian <- temps$top.threshold + 1
    }
    df_top$Bayesian[which(df_top$id==j)] <- temps$Bayesian

  }

  df <- df[ , !(names(df) %in% c("resid","pdt"))]

  if (rank_based == 0) df <- df[ , !(names(df) %in% c("rank_based"))]
  df$Bayesian <- df$income
  df$Bayesian[which(df$Type>1)] <- df_top$Bayesian

  df

}
