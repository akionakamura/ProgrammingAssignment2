## Matrix inversion is usually a costly computation and there 
## may be some benefit to caching the inverse of a matrix rather
## than compute it repeatedly. The functions makeCacheMatrix and
## cacheSolve implement this caching for matrix inversion.

# R Programming
# Programming Assignment 2
# by Thiago Akio Nakamura
# akionakas@gmail.com

## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already
## been calculated (and the matrix has not changed), then the
## cachesolve should retrieve the inverse from the cache.

# To create the matrix, it receives the same arguments as the 
# matrix() function, thus allowing the direct usage of the cached
# version, without needing the previously call the matrix() fuction.
makeCacheMatrix <- function(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL){
	# Create matrix
	x <- matrix(data = data, nrow = nrow, ncol = ncol, byrow = byrow, dimnames = dimnames)
	# Initialize inverse value with NULL
	inv <- NULL
	# Modify matrix
	set <- function(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL){
		# Create modified matrix
		x <<- matrix(data = data, nrow = nrow, ncol = ncol, byrow = byrow, dimnames = dimnames)
		# Set the inverse back to NULL since the matrix has changed
		inv <<- NULL
	}
	# Return the matrix itself
	get <- function() x
	# Set the inverse value of the matrix
	setInv <- function(i) inv <<- i
	# Return the cached inverse value
	getInv <- function() inv
	# Return the list object
	list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## This function creates a special "matrix" object that can cache its inverse.

cacheSolve <- function(x, ...){
	# Get the cached inverse value
	inv <- x$getInv()
	# If there is a value, return that
	if(!is.null(inv)){
		message("Getting cached data.")
		return(inv)
	}
	# If there is no cache, get the matrix and compute the inverse
	data <- x$get()
	inv <- solve(data)
	x$setInv(inv) # Set the inverse value
	inv
}
