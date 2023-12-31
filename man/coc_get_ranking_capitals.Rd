% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_ranking_capitals.R
\name{coc_get_ranking_capitals}
\alias{coc_get_ranking_capitals}
\title{Get Capitals Rankings}
\usage{
coc_get_ranking_capitals(
  location,
  limit = NULL,
  after = NULL,
  before = NULL,
  key = coc_get_key()
)
}
\arguments{
\item{location}{location id, such as 32000249}

\item{limit}{number of items returned in the response.}

\item{after}{return only items that occur after this marker.}

\item{before}{return only items that occur before this marker.}

\item{key}{Required. API key. See \url{https://developer.clashofclans.com/#/documentation}.
Default: \code{get_clash_key()}}
}
\value{
tibble of card info
}
\description{
Get Capitals Rankings
}
\examples{
\dontshow{if (clash::coc_has_key()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
coc_get_ranking_capitals(location = 32000249)
\dontshow{\}) # examplesIf}
}
\concept{locations}
