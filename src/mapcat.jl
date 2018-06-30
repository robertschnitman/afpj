"""
mapcat(f, a, d)
	
Map a function `f` to an array of arrays `a`, concatenating each array vertically (d = 1) or horizontally (d = 2).

INPUTS: function, array of arrays, dimensiosn.

OUTPUT: array.

# sources
Main - https://github.com/robertschnitman/afpj/edit/master/src/mapcat.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/do.bind.R
"""

function mapcat(f, a, d)

apply = map(f, a)

  if (d == 1 || d == 2)
  
    output = cat(d, apply...)

  else
    
	error("The dimensions input must either specify 1 (vertical concatenation) or 2 (horizontal).")
	
  end
  
  output
  
end
