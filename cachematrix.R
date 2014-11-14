## This function creates a special R object that 
## 1. Initializes a variable 'invm' (which will be used to save inverse matrix latter, i.e. a cached data);
## 2. Provides function get() to obtain "raw" matrix (of the one which we need to find its inverse);
## 3. Provides function setInvmatrix() to assign computed inverse matrix (of x) to invm;
## 4. Provides function getInvmatrix() to obtain the cached inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    invm <- NULL
    set <- function(y) {
        x <<- y
        invm <<- NULL
    }
    get <- function() x
    setInvmatrix <- function(Invmatrix) invm <<- Invmatrix
    getInvmatrix <- function() invm

    # return a list of functions as an R object
    list(get=get, setInvmatrix=setInvmatrix, getInvmatrix=getInvmatrix)
}


## This function does the actual inversing of matrix x. It first checks if the inverse matrix has been found; 
## if yes, returns the result and quits. If not, the inverse of x is calculated, saved to cached, and returned.

    cacheSolve <- function(x, ...) {
    invm <- x$getInvmatrix()
    if(!is.null(invm)){
        message("Cached data found.")
        return(invm)
    }
    else {
        message("No cached data found. Calculating inverse matrix...")
        data <- x$get() # obtains matrix from object x
        invm <- solve(data) # finds inverse matrix
        x$setInvmatrix(invm) # assigns resulting inverse matrix to object x
        message("Done.")
        return(invm)
    }
}

