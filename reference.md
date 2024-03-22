Reference
=========

## Memory ##

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

A subset of instructions with immediate and absolute addressing.

Stack: The 6502 has a 256 byte stack at $0100-$01FF. The stack can only be
accessed by transfering from or to X. Push/Pull modify the stack with A.

| OPC | Hex | Dec | B | Notes
|:---:|:---:|----:|:-:|:-------------------------------------
| AND | $29 |  41 | 2 | logical AND with A, immediate
| AND | $2D |  45 | 3 | logical AND with A, absolute
| EOR | $49 |  73 | 2 | logical XOR with A, immediate
| EOR | $5D |  93 | 3 | logical XOR with A, absolute
| ORA | $09 |   9 | 2 | logical OR with A, immediate
| ORA | $1D |  29 | 3 | logical OR with A, absolute
|
| BEQ | $F0 | 240 | 2 | branch if equal, relative
| BMI | $30 |  48 | 2 | branch if minus, relative
| BNE | $D0 | 208 | 2 | branch if not equal, relative
| BPL | $10 |  16 | 2 | branch if plus, relative
|
| JMP | $4C |  76 | 3 | jump, absolute
| JSR | $20 |  32 | 3 | jump to subroutine, absolute
| RTS | $60 |  96 | 1 | return from subroutine
|
| LDA | $A9 | 169 | 2 | load A, immediate
| LDA | $AD | 173 | 3 | load A, absolute
| STA | $8D | 141 | 3 | store A from absolute
| ADC | $69 | 105 | 2 | A += immediate
| ADC | $6D | 109 | 3 | A += absolute
| SBC |     |     |   | A -= immediate
| SBC |     |     |   | A -= absolute
|
| LDX | $A2 | 162 | 2 | load X, immediate
| LDX | $AE | 174 | 3 | load X, absolute
| STX | $8E | 142 | 3 | store X from absolute
| INX | $E8 | 232 | 1 | X++
| DEX | $CA | 202 | 1 | X--
|
| LDY | $A0 | 160 | 2 | load Y, immediate
| LDY | $AC | 172 | 3 | load Y, absolute
| STY | $8C | 140 | 3 | store Y from absolute
| INY | $C8 | 200 | 1 | Y++
| DEY | $88 | 136 | 1 | Y--
|
| TAX | $AA | 170 | 1 | A -> X
| TAY | $A8 | 168 | 1 | A -> Y
| TXA | $8A | 138 | 1 | X -> A
| TYA | $98 | 152 | 1 | Y -> A
|
| INC | $EE | 238 | 3 | increment memory at absolute
| DEC | $CE | 208 | 3 | decrement memory at absolute
|
| TSX | $BA | 186 | 1 | transfer S to X
| TXS | $9A | 154 | 1 | transfer X to S
| PHA | $48 |  72 | 1 | push A to S
| PLA | $68 | 104 | 1 | pull A from S
|


## Mixing ##

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
+ Ampersand goes to 1013 #3F5
	+ POKE 1013 X : POKE 1014 Y : POKE 1015 Z
	+ 76 110 165 CATALOG
	+ 76 165 214 LIST
	+ 76 18 217 RUN
	+ 76 112 214 CLEAR
+ ^D in PRINT statements are DOS code, often as CHR$(4)
+ `PRINT FRE(O)+65536` to find out how much memory is available
+ `BSAVE HIRES A$2000, L$2000` to save hires graphics
+ `BSAVE LOWRES $A400, L$400` to save lowres graphics


