"""
mapsub(f, x, p, out_true) # function, data, predicate, output value if true.
	
Map a function `f` to some data `x` and then substitute the mapping based on predicate `p` a value `out_true`.

OUTPUT: array.

# Example 1 - Redact numbers divisible by 5.
A = [1:100;]
mod5(k) = k % 5 == 0
mapsub(x -> x.^2, A, mod5, "REDACTED - divisible by 5")

# Example 2 - Redact a greeting due to their boring name.
B = ["Aoi", "Tae Min", "Kali", "Robert"]
myname(x) = string.("My name is ", x)
cutoff(x) = ismatch.(r"Robert", x)
mapsub(myname, B, cutoff, "REDACTED - boring name (probably a boring person)")

# Source
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapsub.jl
"""

function mapsub(f, x, p, out_true)

  m = map(f, x)  
 
  output = ifelse(p.(m), out_true, m)
  
  output
  
end