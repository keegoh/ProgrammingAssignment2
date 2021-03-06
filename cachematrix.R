## Matrix inversion is usually a costly computation and their may be some benefit to caching the inverse of a matrix rather than compute it repeatedly. 
## The following is a pair of functions that cache the inverse of a matrix.
## Assumption: Matrix supplied is always invertible (square)

## This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
  inverse <- NULL  # Initialize the inverse to NULL
  
  # Set the inverse to the function parameter, y
  set <- function(y) {  
    x <<- y
    inverse <<- NULL
  }
  
  # Return the matrix
  get <- function() x  
  
  # Set the inverse
  setInverse <- function(i) inverse <<- i  
  
  # Get the inverse
  getInverse <- function() inverse  
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {

  # Set the inverse
  inverse <- x$getInverse()  
  
  # Get the cached inverse if avilable
  if(!is.null(inverse)) {  
    message("getting cached data")
    return(inverse)
  }
  
  # Get the data and compute the inverse if its is not cached
  data <- x$get()  
  inverse <- solve(data)
  
  x$setInverse(inverse)  # Set the inverse
  
  inverse
}
