Applesoft Assembly Annotation
=============================

The Mini-Assembler doesn't allow comments. Here's my unusual way of combining
Applesoft and Assembly that allows annotation.

+ Best in 80-column mode
+ Line number is optionally the decimal address (e.g. from 768 below)
+ DATA string and REM mimic Monitor output
+ Comments follow
+ FOR loop reads DATA and POKEs
+ There is a hex to dec converter subroutine at 100

```
10 REM AAA DEMO
20 ADD = 768 : LINES = 4
30 FOR I = 1 TO LINES : READ A$ : FOR X = 7 TO LEN(A$) STEP 3
40 BYTE$ = MID$(A$,X,2)
50 GOSUB 100
60 POKE ADD, HEX
70 ADD = ADD + 1
80 NEXT : NEXT
90 END

100 REM hex to dec converter: input $BYTE, output HEX
101 HEX = 0
102 B$ = LEFT$(BYTE$, 1)
103 IF ASC(B$) > 57 THEN HEX = 16 * (ASC(B$) - 55)
104 IF ASC(B$) < 58 THEN HEX = 16 * VAL(B$)
105 B$ = RIGHT$(BYTES$, 1)
106 IF ASC(B$) > 57 THEN HEX = HEX + ASC(B$) - 55
107 IF ASC(B$) < 58 THEN HEX = HEX + VAL(B$)
108 RETURN

768 DATA "0300- 20 58 FC" : REM JSR $FC58 : clear screen
771 DATA "0303- A9 C2"    : REM LDA #$C2  : load A with 'B'
773 DATA "0305- 8D 00 40" : REM STA 0400  : store 'B' in A
776 DATA "0308- 60"       : REM RTS       : return
```

![80 Column](aaa-80col.png)
![Monitor](aaa-monitor.png)