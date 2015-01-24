## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    ## Inverse of the matrix x
    i <- NULL 
    
    ## Get the Matrix
    get <- function() {
        x
    }
    
    ## Set the Matrix
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    
    ## Get the Inverse of the Matrix
    getInverse <- function() {
        i
    }
    
    ## Set the Inverse of the Matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }
    
    list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    
    ## Check if the Cache is null, if not return the inverse of the matrix
    if (!is.null(i)) {
        message("Getting the cached inverse matrix")
        return(i)
    } 
    
    ## Calculate the inverse and set it in the special matrix
    i <- solve(x$get())
    x$setInverse(i)
    i
}
