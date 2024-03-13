Practices
=========

## Variables ##

+ Global variables
	+ GA: memory address
+ Function variables
	+ FX, FY, FX1, FX2, FY1, FY2: graphics variables
	+ R0, R1, R2: return variables if there are multiple returns
+ Local variables
	+ I, J used for counters
	+ X, Y, X1, Y1, X2, Y2 for graphics coordiantes
	+ A, B used for memory address and bytes

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
	+ DATA is instruction followed by 0-2 operands, spaced for 3
	+ REM shows instruction as Mini-Assembler and may have comments
+ The end of the AAA block is a RETURN


```
100 GA = 768   : REM using tiny free memory area at #0300
110 GOSUB 1000 : REM run the code loader
120 CALL GA    : REM run the code

1000 REM : something about what this code does
1010 FOR A = GA TO GA + 6 : READ B: POKE A, B: NEXT
1020 DATA 169, 42       : REM LDA #3A : load accumulator directly
1030 DATA 141, 0, 3     : REM STA 300 : store at #0300
1040 DATA 96            : REM RTS     : return from subroutine
1050 RETURN
```

