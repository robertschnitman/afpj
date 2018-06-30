"""
mrchop(f, o, x, m)
	
Map a function f to some data x and then reduce it row-or-column wise. Calls mapslices() and mapreduce().

INPUTS: function, (binary) operator, array/dataframe, margin.

OUTPUT: array/dataframe.

# sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/mrchop.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mrchop.R
"""

mrchop(f, o, x, m) = mapslices(z -> mapreduce(f, o, z), x, m)
