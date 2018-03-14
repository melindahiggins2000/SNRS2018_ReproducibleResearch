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

# combine the vectors
# 4 vectors - each with 10 elements
# let's create a "data frame"

df1 <- data.frame(x1,x2,x3,x4)

# View the data frame

# selectors to choose data elements
# either individually or by row or column

# select the 5th element of x2
x2[5]

# select the 8th element of x4
x4[8]

# in the data frame, select the element
# at row 4, column 2
df1[4,2]

# select the 6th row of df1
df1[6,]

# select the 3rd column of df1
df1[,3]

# list variable names in df1
names(df1)

# ANOTHER way to select 3rd column of df1
# by the variable name "x3"
df1$x3

# use this approach to redo the plot we did above
# but now I'm referencing columns INSIDE the df1
plot(df1$x1, df1$x3, type="b", col = df1$x4)

# load tidyverse package - which includes
# dplyr, ggplot2 and other useful packages
library(tidyverse)

# use the dplyr approach to select a column
# by the variable name - using the pipe
# syntax from dplyr using the %>% symbol
df1 %>%
  select(x3)

# ggplot2 approach
ggplot(df1, aes(x=x1, y=x3)) +
  geom_point(colour = x4) + 
  geom_line(colour = "red")

