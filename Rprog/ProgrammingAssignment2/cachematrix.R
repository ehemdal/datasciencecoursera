## Put comments here that give an overall description of what your
## functions do

# makeCacheMatrix() needs to create a list of elements for a "cached" matrix.
# There are four elements:
# A set function to set the value of the matrix and to use the <<- operator
#  to put it in the "special" environment.
# A get function to return the value of the matrix
# A function to set the inverse of the matrix in the special env.
# A function to get the value of the inverse from the cached (set) value if it exists

# The function will be just like the makeVector sample except that
# the argument will be an R matrix and the calculation will use solve() instead 
# of mean().

## Strategy:
#  Practice to understand how to create and manage a matrix.
#  This is just x <- matrix(..., nrow = , ncol =) (Make it square).

#  Figure out how to use solve().
#  This is just solve(matrix)


## Write a short comment describing this function
## makeCacheMatrix() creates a CacheMatrix object that can cache the calculation
## of its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL # value of inverse starts as NULL 
  
  set <- function (y) {
    x <<- y
    inv <<- NULL # delete the saved inverse if the matrix is re-set
  }
  
  get <- function() x  #return the matrix data
  
  setinv <- function(solve) inv <<- solve(x) # Pass in solve to Calculate the inverse
  
  getinv <- function() inv 

  # Build the CacheMatrix object
  list(set = set, get = get, setinv = setinv, getinv = getinv)

}


## Write a short comment describing this function
# cacheSolve() takes a CacheMatrix object and returns its inverse.
# It calculates the inverse if needed, or returns it from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}