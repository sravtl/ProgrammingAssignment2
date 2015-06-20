## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()){
  m <- NULL
  #define set function
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  #define get function
  get <- function() x
  #define setsolve function
  setsolve <- function(solve) m <<- solve
  #define getsolve function
  getsolve <- function() m
  # return a list with the function i defined below
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  #if I already calculated the inverse I return the cached data
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #I calculate the inverse if I haven't done it before
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
