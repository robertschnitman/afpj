"""
mapfilter(f, p, c) # (map) function, predicate, collection)
	
Map a function `f` and then filter the result by a predicate `p` for a collection `c`.

OUTPUT: array.

# Example
A = [1:10;]
mapfilter(x -> x.^2, isodd, A) # == filter(isodd, map(x -> x.^2, A))

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapfilter.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/mapfilter.R
"""

mapfilter(f, p, c) = filter(p, map(f, c))
