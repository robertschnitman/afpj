"""
sweep(s, o, x, d) # summary statistic, (binary) operator, array, dimension

Operate on an array by a summary statistic. Attempted replication of the R function `sweep()`.

# Example
A = [1:10 11:20 21:30;]
sweep(median(A[:, 1]), /, A, 1) # == mapslices(x -> x./median(A[:, 1]), A, 1) == A./median(A[:, 1])

# Sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/sweep.jl
R origin - https://stat.ethz.ch/R-manual/R-devel/library/base/html/sweep.html
"""

sweep(s, o, x, d) = mapslices(y -> o(y, s), x, d)
