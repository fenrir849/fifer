% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scaleB.R
\name{scaleB}
\alias{scaleB}
\title{Standardize coefficients}
\usage{
scaleB(object, scale.response = F)
}
\arguments{
\item{object}{an object resulting from glm, lm, or lda}

\item{scale.response}{should the response variable be scaled as well? (Usually not for glm or lda).}
}
\value{
an object of the same class as the one outputted
}
\description{
Generic function for obtaining scaled coefficients
}
\details{
Given an object of class lm, glm, or lda, this function will first standardize the variables, then run the model again. The resulting
coefficients will be standardized betas.
}
\examples{
		#### create random data with different means and variances
d = data.frame(matrix(rnorm(5*50, c(10,5,14,100, 33), c(3,5,4,3,5)), nrow=50, byrow=TRUE))
names(d) = LETTERS[1:5]
g = lm(C~B + A + D + E, data=d)
scaleB(g, TRUE)
##### make a logistic
d$A = as.factor(as.numeric(cut(d$A, 2, labels=c(1,0))	))
object = glm(A~B + C + D + E, data=d, family=binomial)
scaleB(object)
##### LDA
object = lda(A~B + C + D + E, data=d, family=binomial)
scaleB(object)
}
\author{
Dustin Fife
}
