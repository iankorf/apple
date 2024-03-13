Performance
===========

Some results from performance testing


## Variables ##

+ Floats are faster than ints
+ Assigning from variables is faster than hard-coding values
+ Array access is a little slower than single variables
+ DATA reads are faster than array reads
+ PEEK and POKE are slower than variable access

## Functions ##

Functions take a single parameter and return a single value. Function calls are
no faster than GOSUBs but at least they have names. 

```
100 DEF FN DIST(X) = SQR( (X1 - X2)^2 + (Y1 - Y2)^ 2 )
200 X1 = 1: Y1 = 1: X2 = 2: Y2 = 2
210 PRINT FN DIST(0)
220 GOSUB 300
230 PRINT RESULT
240 END
300 RESULT = SQR( (X1 - X2)^2 + (Y1 - Y2)^ 2 )
310 RETURN
```

