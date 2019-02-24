"""
mapdims(f, x) # function, 2D Array.
mapc(f, x) # Analagous to mapslices(f, x, 1).
mapr(f, x) # Analagous to mapslices(f, x, 2).
maps(f, A, dims) # Abbreviation of mapslices().

The function `mapdims()` maps over both dimensions of the 2D Array and return as an Array of Arrays. First element contains the row-wise results; the second holds the column-wise computations. The functions `mapc()` and `mapr()` call `mapslices()` to execute operations column-wise or row-wise respectively. The function `maps()` is an abbreviation for `mapslices()`--same functionality is maintained.

# Examples
A = [1:5 6:10;]
mapdims(mean, A)
mapc(mean, A)
mapr(mean, A)
maps(mean, A, 1)

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapdims.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mapdims.R
"""

mapdims(f, x) = map(d -> mapslices(f, x, d), [1; 2]) # Go in Julia order.
mapc(f, x) = mapslices(f, x, 1)
mapr(f, x) = mapslices(f, x, 2)
maps = mapslices
