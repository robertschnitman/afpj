"""
reducechop(o, x, d) # (binary) operator, array/dataframe, dimension
	
Reduce a given collection x with a given binary operator o column-wise (d = 1) or row-wise (d = 2).

OUTPUT: array/dataframe.

# Examples
A = [[1:5;] [6:10;] [11:15;]]
reducechop(*, A, 1) # == mapslices(z -> reduce(*, z), A, 1)
reducechop(*, A, 2) # == mapslices(z -> reduce(*, z), A, 2)

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/reducechop.jl
"""

reducechop(o, x, d) = mapslices(z -> reduce(o, z), x, d)
