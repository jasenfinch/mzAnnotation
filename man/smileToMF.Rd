% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{smileToMF}
\alias{smileToMF}
\title{Convert SMILES to molecular formula}
\usage{
smileToMF(smile)
}
\arguments{
\item{smile}{a valid SMILE}
}
\description{
convert a smile to a molecular formula
}
\examples{
smileToMF(aminoAcids$SMILES[1])
}
