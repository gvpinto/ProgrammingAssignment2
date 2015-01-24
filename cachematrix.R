## The makeCacheMatrix() function creates a special Matrix that wraps
## the matrix with get() set() getInverse() and setInverse()
## functions. 
##
## The cacheSolve() function takes in the special matrix defined
## by makeCacheMatrix(), calculates the inverse of the matrix
## and stores it in specialized matrix cache, if the cache is found empty 
## and then returns the inverse of the matrix. Any repeated request  
## to specialized matrix for the inverse returns the inverse from the cache

## makeCacheMatrix() function takes in a matrix and returns a specialized
## matrix with get(), set(), getInverse() and setInverse()
## functions

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


## The cacheSolve() function takes in the specialized matrix and calculates
## the inverse of the matrix. If the inverse is already found in the cache
## it just returns the inverse matrix from the cache if not it will put the
## calculated value in the cache

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
