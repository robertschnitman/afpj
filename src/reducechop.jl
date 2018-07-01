"""
reducechop(o, x, d)
	
Reduce a given collection x with a given binary operator o column-wise (d = 1) or row-wise (d = 2).

OUTPUT: array/dataframe.

# source
Main - https://github.com/robertschnitman/afpj/blob/master/src/reducechop.jl
"""

reducechop(o, x, d) = mapslices(z -> reduce(o, z), x, d)
