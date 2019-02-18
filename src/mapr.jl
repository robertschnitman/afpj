"""
mapr(f, x)
	
Map a function f to some data x row-wise. Analagous to mapslices(f, x, 2).

INPUTS: function, array/dataframe.

OUTPUT: array/dataframe.

# Examples
See https://github.com/robertschnitman/afp.

"""

function mapr(f, x)
 
  output = mapslices(f, x, 2)      
  
  output
	
end