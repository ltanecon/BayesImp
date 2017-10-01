\name{SIPP1996Analytic}
\alias{SIPP1996Analytic}
\docType{data}
\title{The 1996 SIPP Analytic Data
%%   ~~ data name/kind ... ~~
}
\description{ Includes every person in the 1996 SIPP data born between 1936 to 1971. Zero income observations are excluded.
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("SIPP1996Analytic")}
\format{
  A data frame with 334071 observations on the following 9 variables.
  \describe{
    \item{\code{id}}{Vector of a unique longitudinal identifier for a survey unit across all waves.}
    \item{\code{wave}}{Vector of survey data collection periods.}
    \item{\code{weight}}{Vector of survey weight corrsponding to \code{id}.}
    \item{\code{bottom.threshold}}{Vector of income bottom-coding threshold corrsponding to \code{id} and \code{wave}.}
    \item{\code{top.threshold}}{Vector of income top-coding threshold corrsponding to \code{id} and \code{wave}.}
    \item{\code{income}}{Vector of income corrsponding to \code{id} and \code{wave}.}
    \item{\code{Type}}{A numeric vector indicates bottom/top-coding status of \code{income}. \code{Type} equals 0 if bottom-coded, equals 2 if top-coded, equals 1 if neither.}
    \item{\code{seq_id}}{A numeric vector indicates sequential id of the observation.}
    \item{\code{CPI}}{Vector of CPI corrsponding to \code{wave}.}
  }
}
\details{ An output produced by processing the raw SIPP data with \link{Format_Input}.
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{ https://www.census.gov/sipp/
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{ Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Paper.
(\href{http://litaneconomics.com/Job_Market_Paper.pdf}{link})
%%  ~~ possibly secondary sources and usages ~~
}
\examples{

}
\keyword{datasets}
