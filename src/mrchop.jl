"""
mrchop(f, o, x, d)
	
Map a function `f` to and then reduce by `o` some data `x` column-wise (d = 1) or row-wise (d = 2). Calls mapslices() and mapreduce().

INPUTS: function, (binary) operator, array/dataframe, dimension.

OUTPUT: array/dataframe.

# sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/mrchop.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mrchop.R
"""

mrchop(f, o, x, d) = mapslices(z -> mapreduce(f, o, z), x, d)
