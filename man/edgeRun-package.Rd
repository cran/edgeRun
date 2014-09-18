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
This package provides functions for testing for differential expression for digital data (e.g. RNA-Seq, CAGE-Seq, ChIP-Seq, etc.). Exact unconditional tests based on the negative binomial distribution are provided. Similar functionality exists in the Bioconductor package \code{edgeR} where a similar but conditional exact test is implemented. The unconditional test is more powerful, especially for lowly expressed genes or when sample size is extremely small. 
}
\details{
\tabular{ll}{
Package: \tab edgeRun\cr
Type: \tab Package\cr
Version: \tab 1.0.03\cr
Date: \tab 2014-04-09\cr
License: \tab MIT \cr
}
Users familiar with \code{edgeR} can use \code{edgeRun} functionality by simply using the \code{UCexactTest} function instead of \code{edgeR}'s \code{exactTest} function. We recommend the \code{edgeR} workflow that takes input count data and ends up with a \code{DGEList}. Please refer to \code{edgeR} documentation on how to use that workflow. NOTE: \code{edgeRun} can take several hours to run due to computational complexity, and is only recommended for experiments with very few samples where the power benefit of \code{edgeRun} is more evident. Power gains for larger sample sizes might not be worth the extra running time, in those cases \code{edgeR} is more appropriate and much faster. 
}
\author{
Emmanuel Dimont - Hide Laboratory for Computational Biology. Department of Biostatistics, Harvard School of Public Health. Boston, MA 02115, USA. 

Maintainer: Emmanuel Dimont <edimont@mail.harvard.edu>
}
\references{
Dimont, E., et al. edgeRun: an R package for sensitive, functionally relevant differential expression discovery using an unconditional exact test. bioRxiv doi: http://dx.doi.org/10.1101/008409

Robinson, MD, et al. edgeR: a Bioconductor package for differential expression analysis of digital gene expression data. Bioinformatics 2010;26:139-140.
}

\keyword{ package }
\seealso{
\code{\link{exactTest}},\code{\link{DGEList}}
}
\examples{
\dontrun{# Example taken from edgeR documentation:
# generate raw counts from NB, create list object
# this creates 50 genes across 4 samples, 2 from each group
y <- matrix(rnbinom(50*4,size=1/0.2,mu=10),nrow=50,ncol=4)
d <- DGEList(counts=y, group=c(1,1,2,2), lib.size=colSums(y))
d <- calcNormFactors(d)
d <- estimateCommonDisp(d)
d <- estimateTagwiseDisp(d)

#using edgeR CONDITIONAL exact test
de.edgeR <- exactTest(d) 
topTags(de.edgeR)

#using edgeRun, UNCONDITIONAL exact test
#argument 'upper' specifies the number of iterations
#higher values give more accurate p-values but take longer to run
#see Supplementary Methods (Dimont, et al. 2014) for details
de.edgeRun <- UCexactTest(d,upper=50000) 
topTags(de.edgeRun)


# same p-values using low-level function directly (edgeR)
p.value.edgeR <- exactTestDoubleTail(y[,1:2], y[,3:4]
,dispersion=d$tagwise.dispersion)

p.value.edgeRun <- pvalue(s1=rowSums(y[,1:2,drop=FALSE])
, s2=rowSums(y[,3:4,drop=FALSE]), phi=d$tagwise.dispersion, n1=2, n2=2)
}
}
