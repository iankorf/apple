Reference
=========

## Memory ##

+ https://www.kreativekorp.com/miscpages/a2info/zeropage.shtml
+ Kreative Korp must be a really cool person

| Location  | Use
|:----------|:-----------------------------
| 0000-00FF | zero page
| 0100-01FF | stack
| 0200-02FF | GETLN buffer
| 0300-03CF | free space
| 03D0-03FF | dos & interrupt vectors
| 0400-07FF | text page 1
| 0800-0BFF | text page 2
| 0C00-1FFF | free space
| 2000-3FFF | graphics page 1
| 4000-5FFF | graphics page 2
| 6000-95FF | Applesoft string data
| 9600-BFFF | OS memory
| C000-FFFF | system hardware ports

## DOS 3.3 and ProDos ##

| Command         | Action
|:----------------|:----------------------------------------
| - name          | ProDos: execute file
| INIT name       | initializes disk with program in memory
| BLOAD name      |
| BSAVE name A L  |
| BRUN name       |
| LOAD name       |
| SAVE name       |
| RUN name        |
| MAXFILES N      | set the maximum number of open files
| MON {C}{I}{O}   | selects command, input, output echo
| NOMON ...       | deselects
| CHAIN name      | run another program
| PR#N            | redirects output to slot N (0=40, 3=80, 6=disk)
| IN#N            | redirects input from slot N (0=keyboard)
| CATALOG         | displays disk directory
| CAT             | ProDos: variant catalog
| RENAME old new  |
| DELETE name     |
| LOCK name       |
| UNLOCK name     |
| VERIFY name     |
| OPEN name       |
| READ name       |
| WRITE name      |
| APPEND name     |
| POSITION name X |
| EXEC name       |
| STORE name      | ProDos: stores current variables to disk
| RESTORE name    | ProDos: restores variables to memory
| CREATE name     | ProDos: creates a file
| BYE             | ProDos: ends program
| CALL -151       | from DOS to Monitor
| 3D0G            | from Monitor to DOS
| F666G           | from Monitor to Mini-Assembler
| FF69G           | from Mini-Assembler to Monitor


## Applesoft ##

https://www.calormen.com/jsbasic/reference.html

## Machine Language ##

https://www.nesdev.org/obelisk-6502-guide/reference.html

https://gswv.apple2.org.za/USA2WUG/FOUNDING.MEMBERS/HOME.PAGES/EDHEL/texts/pokes.html

http://6502.org/source/

Stack: The 6502 has a 256 byte stack at $0100-$01FF. The stack can only be
accessed by transfering from or to X. Push/Pull modify the stack with A.
+ Subroutines
	+ $FC58 clear screen
	+ $FDED print char
+ Locations
	+ $24 horizontal cursor
	+ $25 vertical cursor
	+ $78, $78 random number after key entry
	+ $C000 keypress
	+ $C010 clear key

## USR() ##

It is suggested to use `USR()` instead of `CALL` if you have to pass parameters
to and from an ML subroutine. The function takes and returns a float. But why
is this better than `CALL` followed by `PEEK()`?

To obtain a 2-byte integer from the value in the floating-point accumulator,
your subroutine should do a JSR to $E10C. Upon return, the integer value
will be in locations $A0 (high-order byte) and $Al (low-order byte).

To convert an integer result to its floating-point equivalent, so that the
function can return that value, place the two-byte integer in registers A
(high-order byte) and Y (low-order byte). Then do a JSR to $E2F2. Upon
return, the floating-point value will be in the floating-point accumulator.

+ 009D-00A3 (6 bytes) floating point accumulator
+ Store a JMP in 0A-0C for the location of the function
+ RTS to get back to Applesoft

## Software Archive ##

https://archive.org/details/softwarelibrary_apple

## Hacks ##

+ Don't need to type commas: `CATALOGD2`, `NOMONCIO`
+ Follow `PRINT` with semicolon to prevent scrolling
+ ^D in PRINT statements are DOS code, often as CHR$(4)
+ `PRINT FRE(O)+65536` to find out how much memory is available
+ `BSAVE HIRES A$2000, L$2000` to save hires graphics
+ `BSAVE LOWRES $A400, L$400` to save lowres graphics


