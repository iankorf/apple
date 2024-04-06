Ideas
=====

| Function | size |
|:---------|:----:|
| add      |   14 |
| sub      |   14 |
| mul      |   23 |
| rnd      |   18 |
| xyl      |   33 |
| SUBTOTAL |  102 |
| init     | (20) |
| mmov     | (33) |
| update   | (40) |
| TOTAL    |  195 |


-----------------
 init (20)

LDA #$00
STA $06
STA $08
LDA #$28
STA $07
STA $09
set the JMP vector for random init
JSR XY-LOOP
RTS

this is the what gets jumped to
JSR RANDOM  generate a random byte
LDA $D7     it's stored in $D7
ASL
LDA #$00
BCC #$02
INC
set ADD1 given current x and y
GA = $1000 + X*40 + Y
STA GA


-------

set addresses1 given current x and y

used by update and mmov


-----------------

update

123
456
789

1 -41 -41
2 -40   1
3 -39   1
4 -1   38
6 +1    2
7 +39  38
8 +40   1
9 +41   1

-41 +1 +1
+38    +2
+38 +1 +1

set neighborhood to 0
set ADDRESS1 as the cell we're interested in
iterate through the values -41..1 as X register
set ADDRESS2 as the target cell relative to ADDRESS1
LDA w/ ADDRESS2
ADC neighborhood

------------



# life loop
LDA #$01
STA $06
STA $08
LDA #$27
STA $07
STA $09

# memory transfer...
LDA $00
STA ADD1/lo
LDA $10
STA ADD1/hi
LDA $00
STA ADD2/lo
LDA $18
STA ADD/hi

LDA ADD2
STA ADD1
INC ADD1
INC ADD2
CMP whatever
BNE -12
RTS
33 bytes I think
