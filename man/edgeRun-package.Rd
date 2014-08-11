\name{edgeRun-package}
\alias{edgeRun-package}
\alias{edgeRun}
\alias{UCexactTest}
\alias{pvalue}
\docType{package}
\title{
Unconditional exact testing for two-group digital expression data
}
\description{
This package provides functions for testing for differential expression for digital data (e.g. RNA-Seq, CAGE-Seq, ChIP-Seq, etc.). Exact unconditional tests based on the negative binomial distribution are provided. Similar functionality exists in the Bioconductor package edgeR where a similar but conditional exact test is implemented. The unconditional test is more powerful, especially for lowly expressed genes or when sample size is extremely small. 
}
\details{
\tabular{ll}{
Package: \tab edgeRun\cr
Type: \tab Package\cr
Version: \tab 1.0.03\cr
Date: \tab 2014-04-09\cr
License: \tab MIT \cr
}
Users familiar with edgeR can use edgeRun functionality by simply using the \code{UCexactTest} function instead of edgeR's \code{exactTest} function. We recommend the edgeR workflow that takes input count data and ends up with a \code{DGEList}. Please refer to edgeR documentation on how to use that workflow.   
}
\author{
Emmanuel Dimont - Hide Laboratory for Computational Biology. Department of Biostatistics, Harvard School of Public Health. Boston, MA 02115, USA. 

Maintainer: Emmanuel Dimont <edimont@mail.harvard.edu>
}
\references{
Robinson MD, et al. edgeR: a Bioconductor package for differential expression analysis of digital gene expression data. Bioinformatics 2010;26:139-140.
}

\keyword{ package }
\seealso{
\code{\link{UCexactTest}},\code{\link{DGEList}}
}
\examples{
\dontrun{# Example taken from edgeR documentation:
# generate raw counts from NB, create list object
y <- matrix(rnbinom(50*4,size=1/0.2,mu=10),nrow=50,ncol=4)
d <- DGEList(counts=y, group=c(1,1,2,2), lib.size=colSums(y))
d <- calcNormFactors(d)
d <- estimateCommonDisp(d)
d <- estimateTagwiseDisp(d)

de.edgeR <- exactTest(d) #using edgeR CONDITIONAL exact test
topTags(de.edgeR)

de.edgeRun <- UCexactTest(d) #using edgeRun, UNCONDITIONAL exact test
topTags(de.edgeRun)


# same p-values using low-level function directly (edgeR)
p.value.edgeR <- exactTestDoubleTail(y[,1:2], y[,3:4]
,dispersion=d$tagwise.dispersion)

p.value.edgeRun <- pvalue(s1=rowSums(y[,1:2,drop=FALSE])
, s2=rowSums(y[,3:4,drop=FALSE]), phi=d$tagwise.dispersion, n1=2, n2=2)
}
}
