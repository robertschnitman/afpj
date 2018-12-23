"""
mapdims(f, x) # function, 2D Array

Map over both dimensions of the 2D Array and return as an Array of Arrays. First element contains the row-wise results; the second holds the column-wise computations.

# Example
A = [1:5 6:10;]
mapdims(mean, A)

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapdims.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mapdims.R
"""

mapdims(f, x) = map(d -> mapslices(f, x, d), [2; 1])
