## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}

# Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#cache the inverse of a matrix using a pair of functions


#MY code
#1. Create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(m = matrix() ) {
  
  # Initialize the inverse property
  i <- NULL
  
  # Set the matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }
  
  # Method the get the matrix & return the matrix
  get <- function() {
    m
  }
  
  # Method to set the inverse of the matrix
  setInverse <- function(inverse) {
    i <<- inverse
  }
  
  # Method to get the inverse of the matrix & return the inverse property
  getInverse <- function() {
    i
  }
  
  # Return a list of the methods
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# Compute the inverse of the special matrix returned by "makeCacheMatrix" above. 
# If the inverse has already been calculated (&the matrix did not change),
# then the function "cacheSolve" should retrieve the inverse from the cache

# 2.create the cuntion "cacheSolve"

cacheSolve <- function(x, ...) {
  
  # Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
  # Return the inverse if its already set alone
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  # Get the matrix from object
  data <- x$get()
  
  # Calculate the inverse with matrix multiplication
  m <- solve(data) %*% data
  
  # Set the inverse to the object
  x$setInverse(m)
  
  # And lastly, return the matrix
  m
}
