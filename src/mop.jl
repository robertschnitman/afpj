"""
mop(f, o, x, d)   # (summary statistic) function, (binary) operator, array, dimension
sweep(s, o, x, d) # summary statistic, (binary) operator, array, dimension

Operate on an array by a a summary statistic function or explicitly summary statistics. Based on the `afp` R library function `mop()` and the base R function `sweep()` respectively. 

# Example
A = [1:10 11:20 21:30;]
mop(median, /, A, 1)            # == mapslices(x -> x./median(x), A, 1)
sweep(median(A[:, 1]), /, A, 1) # == mapslices(x -> x./median(A[:, 1]), A, 1) == A./median(A[:, 1])

# Sources
1. Main - mop() - https://github.com/robertschnitman/afpj/blob/master/src/mop.jl
2. Main - sweep() - https://github.com/robertschnitman/afpj/blob/master/src/sweep.jl
3. R equivalent - mop() - https://github.com/robertschnitman/afp/blob/master/R/mop.R
4. R origin - sweep() - https://stat.ethz.ch/R-manual/R-devel/library/base/html/sweep.html
"""

mop(f, o, x, d) = mapslices(y -> o(y, f(y)), x, d)
sweep(s, o, x, d) = mapslices(y -> o(y, s), x, d)
