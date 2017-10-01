#' Convert raw data into a \code{data.frame}
#'
#' @description This function process the raw longitudinal information and store them in a \code{data.frame}
#'
#' @param id Vector of a unique longitudinal identifier for a survey unit across all waves.
#' @param wave Vector of survey data collection periods.
#' @param income Vector of income corrsponding to \code{id} and \code{wave}.
#' @param CPI Vector of CPI corrsponding to \code{wave}.
#' @param weight Vector of survey weight corrsponding to \code{id}.
#' @param bottom.threshold Vector of income bottom-coding threshold corrsponding to \code{id} and \code{wave}, or a single value.
#' @param top.threshold Vector of income top-coding threshold corrsponding to \code{id} and \code{wave}, or a single value.
#'
#' @return A \code{data.frame} contains all nesscary information for futher processing in \link{GB2MLE} and \link{Imputation_Method}.
#' @references Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Paper. (\href{http://litaneconomics.com/Job_Market_Paper.pdf}{link})

Format_Input <- function(id,wave,income,CPI,weight=1,bottom.threshold=1,top.threshold){

  n <- length(id)

  if (length(weight)==1) weight <- rep(1,n)
  if (length(bottom.threshold)==1) bottom.threshold <- rep(bottom.threshold,n)
  if (length(top.threshold)==1) top.threshold <- rep(top.threshold,n)

  if (n != length(wave) | n!=length(top.threshold) | n!=length(bottom.threshold)| n!=length(weight) | n!=length(income)) stop("The lengths of the input vectors do not match")

  df <- data.frame(id=id,wave=wave,weight=weight,bottom.threshold=bottom.threshold,top.threshold=top.threshold,income=income, CPI=CPI)

  df$Type <- 1*(df$income>=df$bottom.threshold)+1*(df$income>=df$top.threshold)

  df <- df[with(df, order(id, wave)), ]

  df$seq_id <- 1:length(df$Type)

  df

}


