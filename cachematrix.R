## functions that cache the inverse of a matrix

## this function creates a list containing 4 functions:
## to set the matrix, get the matrix, calculate the inverse and get the inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  calc <- function(solve) i <<- solve
  getinverse <- function() i
  list(set=set, get=get,calc=calc,getinverse=getinverse)
}


## this function checks if the inverse of the matrix has been computed and if yes it
## uses getinverse() to get it from the cache otherwise it uses the solve() function
## to get the matrix inverse and then stores it
cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached inverse")
    return(i)
  }
  message("calculating inverse")
  i <- solve(x$get())
  x$calc(i)
  i
}

