% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exactalg.R
\name{exactalg}
\alias{exactalg}
\title{Segment data into exact change points}
\usage{
exactalg(data, likelihood, max_segments = ncol(data),
  allow_parallel = TRUE)
}
\arguments{
\item{data}{matrix for which to find the change points}

\item{likelihood}{a function receives the segment matrix as argument
and returns a likelihood estimation. This function is used to calculate the
change points that maximize the total likelihood. Depending on the algorithm
being used, this function is likely to be executed many times, in which
case it's also likely to be the bottleneck of the function execution, so
it's advised that this function should have fast implementation.}

\item{max_segments}{an integer that defines the maximum amount of segments to
split the data into.}

\item{allow_parallel}{allows parallel execution to take place using the
registered cluster. Assumes a cluster is registered with the \code{foreach}
package. Defaults to TRUE.}
}
\value{
a list of type \code{segmentr}, which has the two attributes:
\itemize{
\item \code{changepoints}: a vector with the first index of each identified change point
\item \code{segments}: a list of vectors, in which each vector corresponds to the indices
that identifies a segment.
}
}
\description{
Find changes points in data calculating the penalized likelihood for all possible
segment combinations
}
\details{
Function that implements the dynamic programming algorithm, with the intent
of finding points of independent change points for which the likelihood
function is maximized. It analyzes all possible combinations, returning the
change points that are guaranteed to segment the data matrix in the maximum
likelihood independent change points. Because it analyzes all possible combinations
of change points, it has a O-squared algorithm complexity, meaning it works
in an acceptable computation time for small datasets, but it takes quite
longer for datasets with many columns. For big datasets, \code{\link[=hieralg]{hieralg()}} might
be more adequate.
}
