"""
mapcat(f, a, d = 1) # function, array of arrays, dimension.
	
Map a function `f` to an array of arrays `a`, concatenating each array vertically (d = 1, the default) or horizontally (d = 2).

OUTPUT: array.

Particularly useful when the array of arrays are subsets of an original master array and that the desired output is the combined arrays after mapping the subset-contingent function on each of them. Part of the "split-apply-combine" strategy (Wickham 2011).

# Examples
A = [[1:5;] [6:10;] [11:15;]] # Create 3 arrays (A, B, C).
B = [[16:20;] [21:25;] [26:30;]]
C = [[31:35;] [36:40;] [41:45;]]
ABC = [A, B, C] # 3-element Array of Arrays
mapcat(x -> x.^2, ABC)    # Row-wise concatenation (default d = 1) after squaring the 3 columns from each Array.
mapcat(x -> x.^2, ABC, 2) # Column-wise concatenation of the same.

# Sources
Main - https://github.com/robertschnitman/afpj/blob/master/src/mapcat.jl
R equivalent - https://github.com/robertschnitman/afp/blob/master/R/do.bind.R
Wickham, Hadley (2011). "The Split-Apply-Combine Strategy for Data Analysis". Journal of Statistical Software, vol. 40, issue 1. https://www.jstatsoft.org/article/view/v040i01/v40i01.pdf
"""

function mapcat(f, a, d = 1)

  apply = map(f, a)

  if (d == 1 || d == 2)
  
    cat(d, apply...)

  else
    
    error("The dimensions input must either specify 1 (vertical concatenation) or 2 (horizontal).")
	
  end  
  
end
