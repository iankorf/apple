Apple //e
=========

This repo chronicles my rediscovery of programming on the Apple //e.

## AAA Programming ##

One problem with assembly language on the Apple //e is that the Mini-Assembler
is all in-place coding, and doesn't allow code to be relocated or documented.
To mitigate these problems, I have come up with a format called AppleSoft
Assembly Annotation (AAA) for writing assembly language in AppleSoft with
documentation.


+ Memory address (MEM) is set externally
+ Loading
	+ SIZE is set to the number of bytes in the section
	+ FOR loop READs the data and POKEs the bytes
+ Each DATA line is constructed with 3 components
	+ Number is usual BASIC
	+ DATA is instruction followed by 0-2 operands
	+ REM describes instruction and may be followed by lowercase comments
+ The end of the section is a RETURN


```
100 MEM = 768 : REM using tiny free memory area at #0300
110 GOSUB 1000 : REM run the code loader
120 CALL MEM : REM run the code

1000 SIZE = 6: FOR A = MEM TO MEM + SIZE : READ B: POKE A, B: NEXT
1010 DATA 169, 042      : REM LDA #3A : load accumulator directly
1020 DATA 141, 000, 003 : REM STA 300 : store at #0300
1030 DATA 96            : REM RTS     : return from subroutine
1040 RETURN
```

