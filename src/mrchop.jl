"""
mrchop(f, o, x, d) #  function, (binary) operator, array/dataframe, dimension.
	
Map a function `f` to and then reduce by `o` some data `x` column-wise (d = 1) or row-wise (d = 2). Calls mapslices() and mapreduce().

OUTPUT: array/data frame.

# Examples
A = [[1:5;] [6:10;] [11:15;]]
mrchop(x -> x.^2, /, A, 1) # Column-wise reduction of squared elements.
mrchop(x -> x.^2, /, A, 2) # Row-wise of the same.

# Sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/mrchop.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mrchop.R
"""

mrchop(f, o, x, d) = mapslices(z -> mapreduce(f, o, z), x, d)
