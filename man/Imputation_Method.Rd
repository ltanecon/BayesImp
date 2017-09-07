\name{Imputation_Method}
\alias{Imputation_Method}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Populate Imputed Values for the Top-coded Income Observations
%%  ~~function to do ... ~~
}
\description{ A function to populate imputed income values for the top-coded obserations. The imputed income values are produced by the standard, rank-based and Bayesian imputation.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Imputation_Method(df, par = NULL, standard = 1, rank_based = 1, Bayesian = 1, select = NA, prior.grid = 50, rtol = 1e-11)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{df}{ The formatted dataset produced by \link{Format_Input}.
%%     ~~Describe \code{df} here~~
}
  \item{par}{ The GB2 distribution parameters. If not provided, the parameters will be estimated based on the input dataset.
%%     ~~Describe \code{par} here~~
}
  \item{standard}{ Flag for whether imputed income values populated by the standard method is wanted in the output.
%%     ~~Describe \code{standard} here~~
}
  \item{rank_based}{ Flag for whether imputed income values populated by the rank_based method is wanted in the output.
%%     ~~Describe \code{rank_based} here~~
}
  \item{Bayesian}{ Flag for whether imputed income values populated by the Bayesian method is wanted in the output.
%%     ~~Describe \code{Bayesian} here~~
}
  \item{select}{ How many survey waves are selected to estimate the prior distribution used in the Bayesian method. The default value is NA, in which case all survey waves will be selected.
%%     ~~Describe \code{select} here~~
}
  \item{prior.grid}{ Controls the number of bins in \link[REBayes]{WGLVmix}.
%%     ~~Describe \code{prior.grid} here~~
}
  \item{rtol}{ The relative tolerance for dual gap convergence criterion used in \link[REBayes]{KWDual}.
%%     ~~Describe \code{rtol} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{ A \link{data.frame} consists of the following components:

  \item{\code{id}}{Vector passed argument \code{df}}
  \item{\code{wave}}{Vector in the input argument \code{df}}
  \item{\code{income}}{Vector in the input argument \code{df}}
  \item{\code{CPI}}{Vector in the input argument \code{df}}
  \item{\code{weight}}{Vector in the input argument \code{df}}
  \item{\code{bottom.threshold}}{Vector in the input argument \code{df}}
  \item{\code{top.threshold}}{Vector in the input argument \code{df}}
  \item{\code{Type}}{Vector in the input argument \code{df}}
  \item{\code{seq_id}}{Vector in the input argument \code{df}}
  \item{\code{standard}}{Vector in the input argument \code{df}}

%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{ Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Papers.
%% ~put references to the literature/web site here ~
}
\author{ Li Tan
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
