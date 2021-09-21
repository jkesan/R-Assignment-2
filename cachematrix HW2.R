## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { 
  m <- NULL
#Set function assigns input matrix to X and clears cache  
  set <- function(y) {
  x <<- y
  m <<- NULL
  }
#Get function retrieves matrix from parent environment
get <- function() x
#setinv function uses solve rather than mean to label inverse of matrix
setinv <- function(solve) m <<-solve
#getinv function retrieves inverse from parent environment
getinv <- function() m
#Places functions in subsetable list
list(set = set, get = get, setinv = setinv,getinv = getinv)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  #Stores matrix in m, checks for null result, if non-null m is returned with a message
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  #Matrix is acquired and solve is fully executed to find inverse. 
  data <- x$get()
  m <- solve(data,...)
  #Sets the inverse and returns it
  x$setinv(m)
  m
}
x<-matrix(c(1,2,2,1),nrow = 2,ncol=2)
m=makeCacheMatrix(x)
cacheSolve(m)
