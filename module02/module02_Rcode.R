# ----------------------------------
# MODULE 02 - R code
# ----------------------------------
# Getting started with R code

# Type in simple commands
# using the Console as an online calculator

1+1
2^3
pi
log(2.5)

# create "containers" for data
# create and utilize data by assigning
# them to objects - stored in local environment

a <- 1+1
a

a^3
b <- a^3
b

# create 3 vectors and store them

x1 <- c(1,2,3,4,5,6,7,8,9,10)
x2 <- x1*4
x3 <- sin(x1)

# make a plot

plot(x1,x3,type="b",col="blue")

# add a vector of colors

x4 <- c("red","red","red","blue","blue","blue",
        "green","green","green","green")

plot(x1,x3,type="b",col=x4)

# 

