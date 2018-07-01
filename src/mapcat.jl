"""
mapcat(f, a, d = 1)
	
Map a function `f` to an array of arrays `a`, concatenating each array vertically (d = 1, the default) or horizontally (d = 2).

INPUTS: function, array of arrays, dimension.

OUTPUT: array.

Particularly useful when the array of arrays are multiple subsets of an original master array, further wanting to combine the arrays after mapping the subset-contingent function on each of them. Part of the "split-apply-combine" strategy.

# sources
Main - https://github.com/robertschnitman/afpj/edit/master/src/mapcat.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/do.bind.R
Split-apply-combine strategy - https://www.jstatsoft.org/article/view/v040i01/v40i01.pdf
"""

function mapcat(f, a, d = 1)

apply = map(f, a)

  if (d == 1 || d == 2)
  
    output = cat(d, apply...)

  else
    
    error("The dimensions input must either specify 1 (vertical concatenation) or 2 (horizontal).")
	
  end
  
  output
  
end
