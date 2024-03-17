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


