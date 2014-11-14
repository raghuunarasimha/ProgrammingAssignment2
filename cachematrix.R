## This function creates a special R object that 
## 1. Initializes a variable 'invm' (which will be used to save inverse matrix latter, i.e. a cached data);
## 2. Provides function get() to obtain "raw" matrix (of the one which we need to find its inverse);
## 3. Provides function setInvmatrix() to assign computed inverse matrix (of x) to invm;
## 4. Provides function getInvmatrix() to obtain the cached inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    invm <- NULL
    get <- function() x
    setInvmatrix <- function(Invmatrix) invm <<- Invmatrix
    getInvmatrix <- function() invm

    # return a list of functions as an R object
    list(get=get, setInvmatrix=setInvmatrix, getInvmatrix=getInvmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
