% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GB2MLE.R
\name{GB2MLE}
\alias{GB2MLE}
\title{Estimating the GB2 Distribution Parameters by MLE}
\usage{
GB2MLE(df)
}
\arguments{
\item{df}{The longitudinal file.}
}
\value{
A list file contains the estimated GB2 distribution parameters for each \code{wave}.
}
\description{
This function estimates the GB2 parameters by MLE. The log-likelihood function is adjusted to account for the bottom-coded and top-coded income observations. Each \code{wave} are estimated separately.
}
\examples{
GB2MLE(df = SIPP1996Analytic)
}
\references{
Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Papers. (\href{http://litaneconomics.com/Job_Market_Paper.pdf}{link})
}
