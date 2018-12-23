"""
maps(f, A, dims) # function, array, dimensions

Abbreviation of `mapslices()`. Maintains same functionality.

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/maps.jl
"""

maps(f, A, dims) = mapslices(f, A, dims)