"""
mop(f, o, x, d) # (summary statistic) function, (binary) operator, array, dimension

Operate on an array by a summary statistic function. Based on the `afp` R library function `mop()`, which has origins in the R function `sweep()`.

# Example
A = [1:10 11:20 21:30;]
mop(median, /, A, 1) # == mapslices(x -> x./median(x), A, 1)

# Sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/mop.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mop.R
sweep() - https://stat.ethz.ch/R-manual/R-devel/library/base/html/sweep.html
"""

mop(f, o, x, d) = mapslices(y -> o(y, f(y)), x, d)
