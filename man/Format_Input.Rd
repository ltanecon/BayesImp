\name{Format_Input}
\alias{Format_Input}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Format the Data Input for Further Process
%%  ~~function to do ... ~~
}
\description{ This function process the raw longitudinal information into a formatted output dataset. The output belongs the R class \link{data.frame}.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Format_Input(id, wave, income, CPI, weight = 1, bottom.threshold = 1, top.threshold)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{id}{ Vector of a unique longitudinal identifier for a survey unit across all waves.
%%     ~~Describe \code{id} here~~
}
  \item{wave}{ Vector of survey data collection waves.
%%     ~~Describe \code{wave} here~~
}
  \item{income}{ Vector of income subject to income top-coding corrsponding to \code{id} and \code{wave}.
%%     ~~Describe \code{income} here~~
}
  \item{CPI}{ Vector of the CPI corrsponding to \code{wave}.
%%     ~~Describe \code{CPI} here~~
}
  \item{weight}{ Vector of survey weight corrsponding to \code{id}. If not provided, equal weight will be assigned for every survey unit.
%%     ~~Describe \code{weight} here~~
}
  \item{bottom.threshold}{ Vector of income bottom-coding threshold corrsponding to \code{id} and \code{wave}, or a single number if the threshold is the same across survey units and waves. If not provided, the default value is 1.
%%     ~~Describe \code{bottom.threshold} here~~
}
  \item{top.threshold}{ Vector of income top-coding threshold corrsponding to \code{id} and \code{wave}, or a single number if the threshold is the same across survey units and waves.
%%     ~~Describe \code{top.threshold} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A \link{data.frame} consists of the following components:

  \item{\code{id}}{See argument \code{id}}
  \item{\code{wave}}{See argument \code{wave}}
  \item{\code{income}}{See argument \code{income}}
  \item{\code{CPI}}{See argument \code{CPI}}
  \item{\code{weight}}{See argument \code{weight}}
  \item{\code{bottom.threshold}}{See argument \code{bottom.threshold}}
  \item{\code{top.threshold}}{See argument \code{top.threshold}}
  \item{\code{Type}}{A numeric vector indicates the bottom/top-coding status of \code{income}. \code{Type} equals 0 if been bottom-coded, equals 2 if been top-coded, equals 1 if neither.}
  \item{\code{seq_id}}{A numeric vector indicates the observation id.}


%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{ Li Tan
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{ \link{SIPP1996Analytic}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
