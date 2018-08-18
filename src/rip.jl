"""
rip(x, g) # array, group variable (position number).

Partition a collection into an array of arrays with each element being a subset based on the given unique values. Similar to `split()` from R.

OUTPUT: array/dataframe.

# Examples
code = vcat(fill(1, 33), fill(2, 33), fill(3, 33)) # 1st column is a category variable.
A    = [code [101:199;] [201:299;]]
rip(A, 1) # 3-element Array{Array{Int32,2},1}

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/rip.jl
"""

rip(x, g) = map(i -> x[x[:, g] .== i, :], unique(x[:, g]))
