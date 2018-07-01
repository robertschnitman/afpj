"""
mrchop(f, o, x, d = 2)
	
Map a function `f` to some data `x` and then reduce it column-wise (d = 1) or row-wise (d = 2, the default). Calls mapslices() and mapreduce().

INPUTS: function, (binary) operator, array/dataframe, dimension.

OUTPUT: array/dataframe.

# sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/reducemap.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/reducemap.R
"""

reducemap(o, d = 2, f, x) = map(f, reducechop(o, x, d))