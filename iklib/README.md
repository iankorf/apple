iklib
=====

## Zero Page Usage ##

| AD | Usage
|:--:|:--------
| 06 | xyloop: x-init 
| 07 | xyloop: x-max
| 08 | xyloop: y-init
| 09 | xyloop: y-max
| 0A | worker: JMP
| 0B | worker: lo
| 0C | worker: hi
| 1D | address1: lo
| 1E | address1: hi
| CE | address2: lo
| CD | address2: hi
| D7 | random byte
| EB | math
| EC | math
| ED | math
| EE | math

## Subroutines ##

+ add
+ sub
+ mul
+ rnd
+ rnd-init
+ xy-loop



### random byte

This is an 8-bit random byte, so not very random. Call rnd-init before use or
set $D7 for a specific seed.

### xy-loop

The xy-loop runs a 2d loop over limits stored in 06-09. The inner loop runs a
JSR to the worker at 0A.

### worker

Address 0A is a JMP instruction to $0B-0C which is the exact same behavior as
Applesoft USR().

### address1, address2

Two 16-bit areas are reserved for address.

### math

Math functions for add, sub, mul store their operands and return values here.

### free

Some "free" areas not claimed

+ E3
+ EF
+ FA-FE


## Subroutines ##

