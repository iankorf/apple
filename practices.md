Practices
=========

## Variables ##

+ Global variables
	+ GA: memory address
	+ GX, GY: graphics coordinates
+ Function variables
	+ FX, FY, FX1, FX2, FY1, FY2: graphics variables
	+ R1, R2: return variables if there are multiple returns
+ Local variables
	+ I, J used for counters
	+ X, Y, X1, Y1, X2, Y2 for graphics coordiantes
	+ A, B used for memory address and bytes

## Program Structure ##

The overall structure of my programs is shown below.

+ Subroutines are near the start of the program to improve lookups
+ Subroutines start at 100, 200, etc. (unless there are more then 9)
+ One-time initializers start at 1000 (functions, DATA loaders)
+ User interface starts at 2000
+ AAA machine language starts at 3000

```
10 GOTO 1000 : REM jump ahead to the initializers
100 ... a subroutine
200 ... another subroutine
1000 REM initializers
1010 DEF FN DIST(X) = ...   REM cartesian distance
1020 GA = 768 : GOSUB 3000  REM load machine language
2000 REM user interface
3000 REM machine language loader 1
4000 REM machine langauge loader 2
```


## Applesoft Assembly Annotation ##

One problem with assembly language on the Apple //e is that the Mini-Assembler
is all in-place coding, and doesn't allow code to be relocated or documented.
To mitigate these problems, I have come up with a format called Applesoft
Assembly Annotation (AAA) for writing assembly language in Applesoft with
documentation.

+ Use 80-column mode
+ Global memory address (GA) is set externally
+ GOSUB to start of the the AAA block (marked in 1k segments)
+ REM starts the block with a name and description
+ FOR loop READs the data and POKEs the bytes
+ Each DATA line is constructed with 3 components
	+ Number is usual BASIC
	+ DATA is instruction followed by 0-2 operands, spaced for 3 bytes
	+ REM shows instruction as Mini-Assembler and may have comments
+ The end of the AAA block is a RETURN


```
1010 GA = 768 : GOSUB 3000 : REM load whatever at mini-free

3000 REM : something about what this code does
3010 FOR A = GA TO GA + 6 : READ B: POKE A, B: NEXT
3020 DATA 169, 42       : REM LDA #3A : load accumulator directly
3030 DATA 141, 0, 3     : REM STA 300 : store at #0300
3040 DATA 96            : REM RTS     : return from subroutine
3050 RETURN
```

