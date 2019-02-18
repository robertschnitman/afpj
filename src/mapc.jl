"""
mapc(f, x)
	
Map a function f to some data x column-wise. Analagous to mapslices(f, x, 1).

INPUTS: function, array/dataframe.

OUTPUT: array/dataframe.

"""

function mapc(f, x)
 
  output = mapslices(f, x, 1)      
  
  output
	
end
