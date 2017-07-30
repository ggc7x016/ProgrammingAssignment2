## Below function enables cache and reuse of time-consuming computations. 

## makeCacheMatrix creates a list of functions to set/get matrix and 
## set/get reverse of matrix 

makeCacheMatrix <- function(x = matrix()) {

        s <- NULL
	set <- function(y) {
            x <<- y
            s <<- NULL
        }
	get <- function() x
	setsolve <- function(solved) s <<- solved
        getsolve <- function() s
										        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## cacheSolve invokes solve to inverse matrix only if the desired
## invesre not already available in cache 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
	data <- x$get()
        s <- solve(data, ...)
        x$setsolve(s)
        s
}
