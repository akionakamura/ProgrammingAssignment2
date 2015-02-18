# This script tests the Programming Assignment 2 of the Coursera's R Programming course.

# R Programming
# Programming Assignment 2
# by Thiago Akio Nakamura
# akionakas@gmail.com

rm(list=ls())

source("cachematrix.R")

set.seed(100)

message(" ----  Initiating tests  ----- ")

d <- 5;

M1 <- makeCacheMatrix()
message("Call: M1 <- makeCacheMatrix()  -- Check")
print(M1)

M1$set(rnorm(10^2), nrow = d, ncol = d)
message("Call: M1$set(rnorm(10^2), nrow = d, ncol = d)  -- Check")
print(M1$get())
message("Call: M1$get()  -- Check")

M1$setInv(solve(M1$get()))
message("Call: M1$setInv(solve(M1$get()))  -- Check")
print(M1$getInv())
message("Call: M1$getInv()  -- Check")

message("All functions working.")
message("")
message(" ----  cacheSolve testing  ---- ")

d <- 1000

msg <- paste("Matrix M2 size: ", d, " by ", d, ".")
message(msg)

M2 <- makeCacheMatrix(rnorm(d^2), nrow = d, ncol = d)

start.time <- Sys.time()
cacheSolve(M2)
message("Call: cacheSolve(M2)  -- Check")
end.time <- Sys.time()
print("First Inversion")
print(end.time - start.time)
message("")

start.time <- Sys.time()
cacheSolve(M2)
message("Call: cacheSolve(M2) expected to recover cached value  -- Check")
end.time <- Sys.time()
message("Second Inversion")
print(end.time - start.time)

