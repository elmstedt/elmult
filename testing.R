library(elmult)
library(microbenchmark)

n <- 3.5e5
p <- 120
set.seed(123)
.a <- matrix(runif(n * p), nrow = n)
.b <- matrix(runif(n * p), nrow = n)
z <- .a * .b
a <- .a * 1
b <- .b * 1
identical(
  a * b,
  em(a, b)
)
microbenchmark(
  R       = a * b,
  FORTRAN = em(a, b),
  times   = 100,
  setup   = a <- .a * 1,
  check   = "identical"
)
