***Robert Schnitman***  
***2018-07-16***  
***Recommended Citation:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Schnitman, Robert (2018). afpj v0.0.0.1. <https://github.com/robertschnitman/afpj>***

Outline
-------

1.  Introduction
2.  `mapcat()`
3.  `mrchop()`
4.  `mapgrp()`
5. Conclusion
6. References
7. See also

## 0. Installation
---------------
    # Julia >= 0.6.2
    Pkg.clone("https://github.com/robertschnitman/afpj.git")

## 1. Introduction
---------------

The `afpj` package--*Applied Functional Programming in Julia*--is based on the original R library, [`afp`](https://github.com/robertschnitman/afp). Some functions in this library are direct translations, while others cover gaps in Julia functionality. For example, `mapcat()` is the equivalent of `do.bind` and `mrchop()` replicates the process of its R counterpart, whereas `mapgrp()` attempts to simulate `aggregate()` from R.

Thus, the purpose of `afpj` is to supplement base Julia and its libraries to support efficient and concise programming.

The following sections provide examples for the primary functions:
`mapcat()`, `mrchop()`, and `mapgrp()`.

## 2. `mapcat()`
--------------

After mapping a function to an array of arrays, one may wish to concatenate the results with with `[v/h]cat()`. To streamline this procedure, `mapcat()` takes the function, array of arrays, and dimension into a single call--the associated parameters are `f`, `a`, and `d` (1 for row-wise concatenation, 2 for column-wise) respectively.

### EXAMPLE

     A = [[1:5;] [6:10;] [11:15;]] # Create 3 arrays (A, B, C).
     B = [[16:20;] [21:25;] [26:30;]]
     C = [[31:35;] [36:40;] [41:45;]]
     ABC = [A, B, C] # 3-element Array of Arrays
     mapcat(x -> x.^2, ABC, 1) # Row-wise concatenation (default).

|      |      |      | 
|------|------|------| 
| 1    | 36   | 121  | 
| 4    | 49   | 144  | 
| 9    | 64   | 169  | 
| 16   | 81   | 196  | 
| 25   | 100  | 225  | 
| 256  | 441  | 676  | 
| 289  | 484  | 729  | 
| 324  | 529  | 784  | 
| 361  | 576  | 841  | 
| 400  | 625  | 900  | 
| 961  | 1296 | 1681 | 
| 1024 | 1369 | 1764 | 
| 1089 | 1444 | 1849 | 
| 1156 | 1521 | 1936 | 
| 1225 | 1600 | 2025 | 

     mapcat(x -> x.^2, ABC, 2) # Column-wise concatenation of the same.

|    |     |     |     |     |     |      |      |      | 
|----|-----|-----|-----|-----|-----|------|------|------| 
| 1  | 36  | 121 | 256 | 441 | 676 | 961  | 1296 | 1681 | 
| 4  | 49  | 144 | 289 | 484 | 729 | 1024 | 1369 | 1764 | 
| 9  | 64  | 169 | 324 | 529 | 784 | 1089 | 1444 | 1849 | 
| 16 | 81  | 196 | 361 | 576 | 841 | 1156 | 1521 | 1936 | 
| 25 | 100 | 225 | 400 | 625 | 900 | 1225 | 1600 | 2025 | 
     

## 3. `mrchop()`
----------------

As inspired by `mapslices()`, `mrchop()` acts as a dimension-specific version of `mapreduce()`.

The parameters are `f`, `o`, `x`, and `d`--the function, (binary) operator, collection, and dimension respectively.

### EXAMPLE

    A = [[1:5;] [6:10;] [11:15;]]
    mrchop(x -> x.^2, /, A, 1) # Column-wise reduction of squared elements.

|            |            |            | 
|------------|------------|------------| 
| 6.94444e-5 | 1.41723e-6 | 1.12745e-7 | 


    mrchop(x -> x.^2, /, A, 2) # Row-wise of the same.
    
|              | 
|--------------| 
| 0.000229568  | 
|  0.000566893 | 
|  0.000832101 | 
|  0.00100781  | 
|  0.00111111  | 


   

## 4. `mapgrp()`
---------------

The function [`aggregate()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/aggregate.html) from R allows for group-wise calculations. To reproduce and expand upon it by allowing for element-wise operations while maintaining the Array type, `mapgrp()` offers a solution for generating index-based results.

One may obtain similar output with [`groupby()` or `by()` from the DataFrames library](https://en.wikibooks.org/wiki/Introducing_Julia/DataFrames#Subsets_and_groups).  

### EXAMPLE

    code = vcat(fill(1, 33), fill(2, 33), fill(3, 33)) # 1st column is a category variable.
    A    = [code [101:199;] [201:299;]]
    mapgrp(mean, 1, A)   # 3x3 Array. Maximum values by group.
    
|      |         |         | 
|------|---------|---------| 
| 1.0  |   117.0 |   217.0 | 
|  2.0 |   150.0 |   250.0 | 
|  3.0 |   183.0 |   283.0 | 


## 5. Conclusion
-------------

The discussed functions will be improved on a
continuous basis to (1) minimize repetitive iterative computations and (2)
emphasize code efficiency and brevity. New functions to be added based
on feasibility and future needs as appropriate.

## 6. References
-------------
1. [Julia - `DataFrames` - `by()` and `groupby()`](https://en.wikibooks.org/wiki/Introducing_Julia/DataFrames#Subsets_and_groups)  
2. [Julia - `map()`](https://docs.julialang.org/en/v0.6.1/stdlib/collections/#Base.map)  
3. [Julia - `mapreduce()`](https://docs.julialang.org/en/v0.6.1/stdlib/collections/#Base.mapreduce-NTuple%7B4,Any%7D)  
4. [Julia - `mapslices()`](https://docs.julialang.org/en/v0.6.2/stdlib/arrays/#Base.mapslices)  
5. [R programming language](https://www.r-project.org/)  
6. [R - `afp`, the original library](https://github.com/robertschnitman/afp)  
7. [R - `aggregate()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/aggregate.html)  

## 7. See also
------------- 
[Advanced R by Hadley Wickham - Functionals chapter](http://adv-r.had.co.nz/Functionals.html)

*End of Document*
