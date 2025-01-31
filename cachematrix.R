####THIS IS WHERE MY ANSWER STARTS
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#makeChaceMatrix is defined using a function with x = matrix as its argument and as we discussed it is assumed to be invertible, it is also called the parent function
 
makeCacheMatrix <- function(x = matrix()) {
        invert <- NULL #will be used within the above function, for now its NULL 
        set <- function(y){
                x <<- y #used to give matrix() a value though the environment will not be within the current global environment, this new environment is the sibiling function 
                invert <<- NULL # invert also must be defined within this new environment which matrix() will be defined in 
        }
        get <- function()x #this retrieves the value of the matrix 
        setinverse <- function(inverse) invert <<- inverse #now we need inverse to have a value as well 
        getinverse <- function() invert #once we have the value of the inverse now we need to get the inverse 
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        #using all of these functions that are defined in both the parent and the sibiling function our "special vector : makeCacheMatrix" will be returned using the funcions
}

## we need to calculate the inverse of this matrix "makeChaceMean" using the function created and defined above
cacheSolve <- function(x, ...) {
        invert <<- x$getinverse() #this function will give us a matrix which is the inverse of the one we started out with (x)
        if (!is.null(invert)){  #if invert does not equal null then give the message below and return the invert as defined above
                message("can get cached data, wait")
                return(invert)
        } # if the inverse cannot be retived from the cache then the computation is below
        data <- x$get() #get() is a function which is used to retrieve the value of the matrix 
        invert <- solve(data, ...) #solve is an R function which is used to compute, in this case it is set to compute invert which is defined as x$getinverse
        x$setinverse(invert) #the cache must have some value for inverse
        invert 
        ## Return a matrix that is the inverse of 'x'
}
# now lets see how they work or if they work
create <- makeCacheMatrix(matrix(1:4, nrow = 2, ncol = 2))
create$get() #returns a 2x2 matrix containing the numbers 1:4
create$getinverse() #returns NULL, so it is not cached so we move onto the cacheSolve() function
cacheSolve(create) # returns the inverse of the makeChacheMatrix
