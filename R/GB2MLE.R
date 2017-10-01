#' Estimating the GB2 Distribution Parameters by MLE
#'
#' @description This function estimates the GB2 parameters by MLE. The log-likelihood function is adjusted to account for the bottom-coded and top-coded income observations. Each \code{wave} are estimated separately.
#'
#' @param df The longitudinal file.
#'
#' @return A list file contains the estimated GB2 distribution parameters for each \code{wave}.
#' @examples
#' GB2MLE(df = SIPP1996Analytic)
#' @references Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Paper. (\href{http://litaneconomics.com/Job_Market_Paper.pdf}{link})

GB2MLE <- function(df){

  par <- list()

  MLE <- function (z, g, w){

    fn <- function(x, z, g, w) {
      a <- x[1]
      b <- x[2]
      p <- x[3]
      q <- x[4]
      sw <- sum(w)
      loglik <- 0
      for (i in 1:length(z)){

        if (g[i]==1) {loglik <- loglik+logf.gb2(z[i], a, b, p, q)*w[i]}
        else if (g[i]==0) {loglik <- loglik+max(log(pgb2(z[i], a, b, p, q)),-1000)*w[i]}
        else {loglik <- loglik+max(log(1-pgb2(z[i], a, b, p, q)),-1000)*w[i]}

      }
      -loglik/sw
    }

    x0 <- fisk(z, w)
    opt1 <- optim(x0, fn, gr=NULL, z, g, w, method = "BFGS", control = list(parscale = x0,
                                                                            pgtol = 1e-08), hessian = F)
    opt1$par
  }

  for (i in unique(df$wave)){

    temp <- df[which(df$wave==i),]
    temp$incomen <- pmax(pmin(temp$income,temp$top.threshold),temp$bottom.threshold)
    par[[i]] <- MLE(temp$incomen,temp$Type,temp$weight)

  }

  par

}
