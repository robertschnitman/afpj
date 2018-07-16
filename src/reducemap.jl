"""
reducemap(o, f, x, d) # function, (binary) operator, array/dataframe, dimension.
	
Reduce column-wise (d = 1) or row-wise (d = 2) and then map a function `f` to some data `x`. Calls map() and reducechop(), which further calls mapslices() and reduce().

OUTPUT: array/dataframe.

# Examples
A = [[1:5;] [6:10;] [11:15;]]
reducemap(/, x -> x.^2, A, 1) # == map(x -> x.^2, mapslices(z -> reduce(/, z), A, 1))
reducemap(/, x -> x.^2, A, 2) # == map(x -> x.^2, mapslices(z -> reduce(/, z), A, 2))

# Sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/reducemap.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/reducemap.R
"""

reducemap(o, f, x, d) = map(f, reducechop(o, x, d))
