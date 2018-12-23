"""
mapdims(f, x) # function, 2D array

Map over both dimensions of the 2D array and return as an array-of-arrays. First element contains the row-wise results; the second holds the column-wise computations.

# Example
A = [1:5 6:10;]
mapdims(mean, A)

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapdims.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mapdims.R
"""

function mapdims(f, x)
  row = mapslices(f, x, 2)
  col = mapslices(f, x, 1)
  
  out = [[row]; [col]]
  
  out
  
end