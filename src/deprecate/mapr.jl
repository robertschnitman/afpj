"""
mapr(f, x)
	
Map a function f to some data x row-wise. Analagous to mapslices(f, x, 2).

INPUTS: function, array/dataframe.

OUTPUT: array/dataframe.

"""

function mapr(f, x)
 
  output = mapslices(f, x, 2)      
  
  output
	
end
