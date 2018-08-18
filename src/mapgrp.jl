"""
mapgrp(f, g, x) # function, group variable (column position), collection.

Apply a function `f` based on a grouping variable `g` to a collection `x` . Calls map() and rip().

OUTPUT: array/dataframe.

# Examples
code = vcat(fill(1, 33), fill(2, 33), fill(3, 33)) # 1st column is a category variable.
A    = [code [101:199;] [201:299;]]
mapgrp(mean, 1, A)   # 3x3 Array. Maximum values by group.
mapgrp(x -> x.^2, 1, A) # 99x3 Array. Squared values per group.
mapgrp(x -> sum(x.^2), 1, A) # 99x3 Array. Sum of squared values per group.

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapgrp.jl
rip() - https://github.com/robertschnitman/afpj/blob/master/src/rip.jl
"""

function mapgrp(f, g, x)
  
  # 1. Split
  part1 = rip(x, g)
  part2 = map(y -> y[:, 1:end .!= g], part1)
  
  # 2, Apply
  # apply = vcat(map(y -> mapslices(z -> f(z), y, 1), part2)...)
  apply = map(y -> mapslices(z -> f(z), y, 1), part2)
  
  # 3. Combine
  nrow  = map(k -> size(k, 1), apply)[:, 1]
       
  col_code = vcat(map((y, n) -> fill(y, n), unique(x[:, g]), nrow)...)
  
  apply_cat = vcat(apply...)
  
  output = hcat(col_code, apply_cat)
    
  output
  
end
