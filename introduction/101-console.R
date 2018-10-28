# basic commands ----------------------------------------------------------

1+1
2^5
x <- 10
x
x <- 16   # re-assign
x
sqrt(x)
x == 15

TRUE
TRUE && FALSE
TRUE || FALSE

y <- c(1, 2, 5)
length(y)

x <- sqrt(x)  # re-assign using self
(x <- x + 1)  # assign and print

# rerun previous command several times to show
#  - repeated re-assignment
#  - going back to previous commands

z <- 4
z
rm(z)
z

ls()

# types -------------------------------------------------------------------

typeof(1)
typeof(1L)
typeof("Hello, World!")
typeof(TRUE)

# there exist ebbreviations
T == TRUE
F == FALSE

# T, F are variables. don't overwrite them
T <- "whatever"     # don't! never!
T
rm(T)
T
TRUE <- "whatever"  # fails
# capital T is often used in time series as length
# write \sum_{t=1}^{T} x_t on whiteboard to show example
# f(x) = x + 1; F(x) = 2 * x^2 + x + c

# implicit conversion
typeof(1L + 1)
1 == 1L
1 == "1"
TRUE == 1
TRUE == 2

# everything is vector
y
is.vector(y)
length(y)
x
is.vector(x)
length(x)

c(x, 1)
c(x, x)
c(x, y)

integer(10)
character(100)
logical(5)
logical(0)

NA
NA_integer_

c(1, NA)
is.na(c(1, 2, NA, 4))

NaN
Inf

log(0)
1 / 0
Inf - Inf

Inf + 2
Inf > 1

NULL
c(1, NULL)


# vectorized operations ---------------------------------------------------

y <- c(1, 2, 5)
y + 1
y^2
log(y)

# combining two vectors works
x <- c(2, 7, 1)
x
y
x + y

# different length, produces warning
x <- c(2, 7, 1, 3)
x
y
x + y

# different length, no warning!!!
# tidyverse has solution
x <- c(2, 7, 1, 3, 5, 7)
x
y
x + y

# logical operations
# single character
T || F
T | F

c(T, F) || c(F, F)  # uses only the first, no warning !!!
c(T, F) | c(F, F)

# comparisons
1:5 < 5:1
1:3 %in% 2:100


# apply functions ---------------------------------------------------------

sapply(x, exp)  # simplified apply
exp(x)          # the same, but faster
lapply(x, exp)  # list apply

# no vectorization
seq(10)
x <- c(7, 6, 2)
seq(x)          # doesn't work as expected
lapply(x, seq)
sapply(x, seq)  # doesn't simplify, same as lapply



# subsetting --------------------------------------------------------------

x <- c(1, 3, 5, 7, 9)
x[5]
x[1:3]
x[c(3, 1)]
x[-1]  # different to Python

x[3:length(x)]
x[(length(x) - 2):length(x)]
rev(rev(x)[1:3])  # the same

# sequences ---------------------------------------------------------------

1:5
seq(5)  # don't use this
seq_len(5)

seq(0)
1:0
seq_len(0)

x <- c(1,5,9,3,5,7,4,5,6)
x[1:3]    # ok
n <- 3
x[1:n]    # don't
x[seq(n)] # don't
x[seq_len(n)]
n <- 0
x[1:n]
x[seq(n)]
x[seq_len(n)]

# sequence along
x <- c(1, 5, 3, 4, 7)
seq(x)                     # don't
seq_along(x)



# matrices ----------------------------------------------------------------

a <- matrix(c(1,2,3, 4,5,6), ncol = 3, byrow = T)
a
t(a)

dim(a)
ncol(a)
nrow(a)
length(a)

a + 1
a^2
a * a  # element-wise
a * t(a)

a %*% t(a)
t(a) %*% a
a %*% a

matrix(1, 5, 5)  # same as ones(5) in Matlab/Python
x
diag(x)

a
is.matrix(a)
is.vector(a)  # it's a lie

# not importatnt, just be aware that R isn't always honest
str(a)
attributes(a)
attr(a, 'dim') <- NULL
attributes(a)
a
is.matrix(a)
is.vector(a)


# lists -------------------------------------------------------------------

# presentation - list of types

# not the same type
c(TRUE, 1, 'hi')
c(TRUE, 1)

list(TRUE, 1, 'hi!')
list(x = TRUE, y = 1, z = "hi!")

my_list <- list(TRUE, 1, 'hi!')
my_list[[1]]
my_list[1]
# salt example in slides

my_list[[3]] <- 'something else'
my_list
my_list[4:6] <- list(42, 'hi!', list())
my_list

my_list <- list(x = TRUE, y = 1, z = "hi!")
my_list[['x']]
my_list$x
my_list['x']
my_list[['new_element']] <- list(a = 1, b = 2)
my_list$another_element <- TRUE
my_list

length(my_list)
sapply(my_list, typeof)

a <- list(x = 1, y = 2, z = NULL)
a
a$y <- NULL
a

# lists are vectors, too!
is.vector(list())
is.list(vector())


# data frames -------------------------------------------------------------

# just a quick intro - we will be using tidyverse dataframes instead

df <- data.frame(x = 101:105, y = c('a', 'b', 'c', 'd', 'e'))  # can be replaced with letters[1:5]

nrow(df)
ncol(df)
dim(df)
rownames(df)
colnames(df)

df$x
df[['x']]
df[, 'x']

df[2:4, 'x']
df$x[2:4]
df[['x']][2:4]

# all previous can be used for assignment as well
df$z <- numeric(5)
df[1:2, 'z'] <- c(7, 4)

df$y    # factor, annoying, not in tidyverse
typeof(df$y)

typeof(df)
attributes(df)
class(df)
attributes(df) <- NULL

df

iris
iris[1:5, c('Sepal.Length', 'Sepal.Width')]
iris$Species
iris$Species == 'setosa'
iris[iris$Species == 'setosa', 'Sepal.Length']
iris[iris$Species == 'setosa', endsWith(colnames(iris), 'Width')]


# all this could have been done without RStudio
# show in terminal