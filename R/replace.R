##' Replace values in a vector
##'
##' Replace the values in a vector with a new value
##'	
##' This function searches the vector provided for old.values, then replaces each occurance with new.values
##' @param x The vector that has values that need replacing
##' @param old.value The value that needs replacing
##' @param new.value The value that will replace old.value
##' @param factor Should the vector be "refactored" (so old values no longer show up as a factor level)?
##' @return A new vector where old.values are replaced by new.values
##' @author Dustin Fife
##' @export
##' @examples
##' d = data.frame(category = sample(c("Male", "Female", "Men"), prob=c(.45, .45, .05), size=100, replace=T))
##' table(d$category)
##' d$category = replace(d$category, "Men", "Male")
##' table(d$category)
replace = function(x, old.value, new.value, factor=F){
	
	#### change x to character if needed
	if (is.factor(x)){
		x =as.character(x)
	}
	x[x==old.value] = new.value
	if (factor){
		x = factor(x)
		}
	return(x)
}