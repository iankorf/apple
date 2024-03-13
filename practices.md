Practices
=========

## Variables ##

Is it best to use integer variables for integers or are floats fast?

+ Global variables
	+ GA: memory address passed in GOSUBs
	+ GX: X-coordiante
	+ GY: Y-coordinate
+ Local variables
	+ I, J used for counters  
	+ X, Y, X1, Y1, X2, Y2 for graphics coordiantes
	+ A, B used for memory address and bytes
+ Functions...



## Applesoft Assembly Annotation ##

One problem with assembly language on the Apple //e is that the Mini-Assembler
is all in-place coding, and doesn't allow code to be relocated or documented.
To mitigate these problems, I have come up with a format called Applesoft
Assembly Annotation (AAA) for writing assembly language in Applesoft with
documentation.


+ Memory address (MEM) is set externally
+ Loading
	+ GOSUB to the AAA block
	+ SIZE is set to the number of bytes
	+ FOR loop READs the data and POKEs the bytes
+ Each DATA line is constructed with 3 components
	+ Number is usual BASIC
	+ DATA is instruction followed by 0-2 operands
	+ REM describes instruction and may be followed by lowercase comments
+ The end of the AAA block is a RETURN


```
100 GA = 768   : REM using tiny free memory area at #0300
110 GOSUB 1000 : REM run the code loader
120 CALL GA    : REM run the code

1000 SIZE = 6: FOR A = GM TO GM + SIZE : READ B: POKE A, B: NEXT
1010 DATA 169, 042      : REM LDA #3A : load accumulator directly
1020 DATA 141, 0, 3     : REM STA 300 : store at #0300
1030 DATA 96            : REM RTS     : return from subroutine
1040 RETURN
```

