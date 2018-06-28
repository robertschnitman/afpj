"""
    mrchop(f, o, x, m)
	
Map a function f to some data x and then reduce it row-or-column wise. Calls mapslices() and mapreduce().

INPUTS: function, (binary) operator, array/dataframe, margin.

OUTPUT: array/dataframe.

# source
https://github.com/robertschnitman/afp.

"""

mrchop(f, o, x, m) = mapslices(z -> mapreduce(f, o, z), x, m)