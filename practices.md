Practices
=========

## Variables ##

+ GA%: global memory address for GOSUBs
+ GV%: global 16-bit value for GOSUBs
+ X, Y, X1, Y1, X2, Y2 graphics

## Program Structure ##

The overall structure of my programs is shown below.

+ Subroutines are near the start of the program to improve speed
+ One-time initializers start at 1000 (variables, functions, AAA loaders)
+ User interface starts at 2000
+ AAA machine language starts at 3000

```
10 GOTO 1000 : REM jump ahead to the initializers
100 subroutines...
1000 REM initializers
2000 REM user interface
3000 REM machine language
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
1010 GA = 768 : GOSUB 3000 : REM using mem at #0300

3000 REM : something about what this code does
3010 FOR A = GA TO GA + 6 : READ B: POKE A, B: NEXT
3020 DATA 169, 42       : REM LDA #3A : load accumulator directly
3030 DATA 141, 0, 3     : REM STA 300 : store at #0300
3040 DATA 96            : REM RTS     : return from subroutine
3050 RETURN
```

## Stuff ##

2-byte set/get (but do I need this?)

```
16 POKE GA,GV-INT(GV/256)*256 : POKE GA+1,INT(GV/256) : RETURN : REM 16-bit set
17 GV = PEEK(GA) + PEEK(GA+1)*256 : RETURN : REM 16-bit get
```

Memory move

```
3000 REM memory mover
3010 FOR A = 768 TO 772 : READ B : POKE A, B : NEXT
3020 DATA 160, 0, 76, 44, 254
3020 DATA 160,  0     : REM LDA 0
3030 DATA  76, 44,254 : REM JMP FE28?
3030 RETURN

20 GV=OS: GA=60: GOSUB 16 : REM OS = old starting address
21 GV=OE: GA=62: GOSUB 16 : REM OE = old ending address
22 GV=NS: GA=66: GOSUB 16 : REM NS = new starting address
23 CALL 768
```

49152 read keyboard
49168 clear keyboard
