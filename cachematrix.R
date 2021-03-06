## These functions compute and store inverses of invertible matrices.

## The following function takes a matrix and generates a list with the original matrix and the computed inverse. 
# Set function sets the original matrix and get function returns the original matrix. 
# Setinv function receives computed inverse from cacheSolve function and stores it as i which can be accessed through getinv.
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y){
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) i <<- inverse
        getinv <- function() i
        list(set = set, get = get, 
             setinv = setinv,
             getinv = getinv)
}

## The following function computes the inverse of the matrix generated by makeCacheMatrix.
# It first checks whether the inverse is already computed and stored for the matrix (x). 
# If it is, this function retrieves the inverse (i) via $getinv and returns i.
# If not, it computes the inverse and stores it in i though setinv.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinv()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinv(i)
        i
}
