"""
mapc(f, x)
	
Map a function f to some data x column-wise. Analagous to sapply() in R.

INPUTS: function, array/dataframe.

OUTPUT: array/dataframe.

# Examples
See https://github.com/robertschnitman/afp.

"""

function mapc(f, x)
 
  output = mapslices(f, x, 1)      
  
  output
	
end