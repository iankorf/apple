Applesoft Assembly Annotation
=============================

One problem with assembly language on the Apple //e is that the Mini-Assembler
is all in-place coding, and doesn't allow code to be relocated or documented.
To mitigate these problems, I have come up with a format called Applesoft
Assembly Annotation (AAA) for writing assembly language in Applesoft with
documentation. Not sure this is a great idea. Maybe just get an actual
full assembler.

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

