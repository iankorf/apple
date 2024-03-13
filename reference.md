Reference
=========

## Machine ##

Memory Map

| Location  | Use
|:----------|:-----------------------------
| 0000-00FF | zero page
| 0100-01FF | stack
| 0200-02FF | GETLN buffer
| 0300-03CF | free space
| 30D0-03FF | dos & interrupt vectors
| 0400-07FF | text page 1
| 0800-0BFF | text page 2
| 0C00-1FFF | free space
| 2000-3FFF | graphics page 1
| 4000-5FFF | graphics page 2
| 6000-95FF | AppleSoft string data
| 9600-BFFF | OS memory
| C000-FFFF | system hardware ports

+ Graphics
	+ LoRes: 80x40 (40x40, 48x40)
		+ Colors
			+ BLACK
			+ MAGENTA
			+ DARK CLUE
			+ PURPLE
			+ DARK GREEN
			+ GREY
			+ MEDIUM BLUE
			+ LIGHT BLUE
			+ BROWN
			+ ORANGE
			+ GREY
			+ PINK
			+ GREEN
			+ YELLOW
			+ AQUA
			+ WHITE
	+ HiRes: 560x192 (280x192)
		+ Colors
			+ SET1 (odd X-coordinate)
				+ BLACK
				+ GREEN
				+ VIOLET
				+ WHITE
			+ SET2 (even X-coordinate)
				+ BLACK
				+ ORANGE
				+ BLUE
				+ WHITE


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

| Command         | Action
|:----------------|:------------------
| FP              | clear memory and start AppleSoft Basic
| FRE             | ProDos: performs house-cleaning for AppleSoft Basic
| INT             | clear memory and start Integer Basic
| NEW             | erases current program and resets memory
| CLEAR           | resets variables
| DEL             | delete lines of program
| LIST            |
| LIST N-M        |
| RUN {N}         | run program, optionally from line N

+ Math
	+ most math operators work as usual
	+ not-equal is <> or ><
	+ SQR()
	+ Trig: SIN(x), COS(x), TAN(x), ATN(x)
	+ Log: EXP(x), LOG(x)
	+ DEF FN(x) = aexpr
+ String
	+ concatenation is with +
	+ LEFT$(s, x)
	+ MID$(s, x, y)
	+ RIGHT$(s, x)
	+ STR$(x)
	+ VAL(s)
	+ CHR$(x)
+ Variable Control
	+ [LET] var = expr
	+ REAL AB(x, y, z)
	+ INTEGER AB%(x, y, z)
	+ STRING AB$(x, y, z)
	+ DIM var( size [, size ...] ) [, var( size [, size ...] ) ...]
	+ DEF FN name(var) = aexpr
+ Flow Control
	+ GOTO
	+ GOSUB
	+ RETURN
	+ On aexpr GOTO linenum [, linenum ...]
	+ ON aexpr GOSUB linenum [, linenum ...]
	+ POP Convert last GOSUB into a GOTO
	+ FOR var = aexpr TO aexpr [ STEP aexpr ]
	+ NEXT [var [, var ...] ]
	+ IF expr THEN statement
	+ IF expr GOTO linenum
	+ END - terminate normally
	+ STOP - break as if an error has occurred
	+ CONT - continue from stop
+ Error Handling
	+ ONERR GOTO linenum
	+ RESUME - retry line that caused ONERR GOTO
+ TEXT I/O
	+ PRINT expr [ [;,] expr ... ] [;]
	+ INPUT [string ;] var [, var ...] - read line of comma-delimited input
	+ GET char - read a single key
	+ HOME - clear text display
	+ HTAB x - position text cursor horizontally 1..24 (1.80)
	+ VTAB y - position text cursor vertically 1..24
	+ INVERSE - set to black on white
	+ FLASH - flashing text
	+ NORMAL - white on black
	+ TEXT - set to text mode (from graphical modes)
+ Lo-Res Graphics
	+ GR
	+ COLOR=x 0..15
	+ PLOT x, y 0..39, 0..39
	+ HLIN x1, x2 AT y
	+ VLIN y1, y2 AT x
+ Hi-Res Graphics
	+ HGR
	+ HGR2
	+ HPLOT [TO] x1, y1 [TO] x2, y2
	+ HCOLOR = x 0..7
+ Inline Data
	+ DATA value [, value...] - define data
	+ READ var [, var ...] - read the next data value
	+ RESTORE - reset the DATA pointer to first value
+ Misc
	+ REM - comment to end of line
	+ TRACE - turn on trace mode
	+ NOTRACE - turn off trace mode
+ Shape Tables (ROT, SCALE, DRAW, XDRAW)
+ Memory (HIMEM, LOWMEM, WAIT)
+ POKE
+ CALL

## Machine Language ##

Abbreviations

+ A: accumulator
+ S: stack
+ X: x register
+ Y: y register

Status Register

+ N branch on plus/minu
+ V
+ blank
+ B
+ D decimal mode
+ I
+ Z branch on != or ==
+ C

| Abr | ## | DEC | B | Meaning
|:---:|:--:|:---:|:-:|----------------------------
| ADC | 69 | 105 | 2 | add to A with carry
| ADC | 65 | 101 | 2 | add to A with carry from zero page
| AND | 29 |  41 | 2 | AND with A
| ASL | 13 |  19 | 1 | A shift left bytes
| BCC | 90 | 144 | 2 | branch on carry clear
| BCS | B0 | 176 | 2 | branch on carry set
| BEQ | F0 | 240 | 2 | branch if equal
| BMI | 30 |  48 | 2 | branch if minus
| BNE | D0 | 208 | 2 | branch if not equal n bytes
| BPL | 10 |  16 | 2 | branch if plus
| CLC | 18 |  24 | 1 | clear carry flag
| CMP | C9 | 201 | 2 | compare with A 
| CPX | E0 | 224 | 2 | compare with X
| CPY | C0 | 192 | 2 | compare with Y
| DEC | C6 | 198 | 2 | decrement memory location
| DEX | CA | 202 | 1 | decrement X
| DEY | 88 | 136 | 1 | decrement Y
| FBC | E9 | 233 | 2 | subtract from A
| INX | E8 | 232 | 1 | increment X
| INY | C8 | 200 | 1 | increment Y
| JMP | 4C |  76 | 3 | jump to memory location
| JSR | 20 |  32 | 3 | jump to subroutine
| LDA | A1 | 161 | 2 | 
| LDA | A9 | 169 | 2 | load A
| LDA | AD | 173 | 3 | load A from addr
| LDA | B1 | 177 | 2 | load A + Y?
| LDA | B5 | 181 | 2 | load A from zero page
| LDA | BD | 189 | 3 | load A from addr + X
| LDA | B9 | 185 | 3 | load A from Y
| LDA | B1 | 177 |   | 
| LDX | A2 | 162 | 2 | load X
| LDX | A6 | 166 | 2 | load X zero page
| LDY | A0 | 160 | 2 | load Y
| LDY | BC | 188 | 3 | load Y from addr
| NOP | EA | 234 | 1 | no operation
| PHA | 48 |  72 | 1 | push A on S
| PLA | 68 | 104 | 1 | pull from S to A
| RTS | 60 |  96 | 1 | return from subroutine
| STA | 85 | 133 | 2 | store from accumulator to zero page address
| STA | 8D | 141 | 3 | store from accumulator to memory address
| STA | 99 | 153 | 3 | store in memory location + Y
| TAX | AA | 170 | 1 | transfer from A to X
| TXA | 8A | 138 | 1 | transfer from X to A

+ 1-byte, implied instructions are just the mnemonic
+ immediate mode, value gets #



| Addr | Function
|:----:|:------------------------
| F800 | plot a point (uses A and Y)
| FB40 | set graphics mode
| FC58 | clear screen
| FD1B | random number
| FD35 | get keystroke
| FDDA | display accumulator HEX
| FDED | display accumulator
