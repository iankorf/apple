Conway's Game of Life by drKorf
===============================

+ ALIFE - Applesoft
+ BLIFE - Experimental version with mixed machine language


## ALIFE ##

This is my 100% pure Applesoft version that serves as the base for other
versions. I didn't really want to unroll the neighbor-counting loop, but it's
so slow with another 2 loops.

```
10 GOTO 1000

100 REM ===== display =====
101 FOR X = X0 TO XN: FOR Y = Y0 TO YN
102 HTAB X+1 : VTAB Y+1
103 IF G%(X,Y) = LIVE THEN PRINT("*");
104 IF G%(X,Y) = DEAD THEN PRINT(" ");
105 NEXT : NEXT
106 VTAB 2 : HTAB GEN : PRINT ".";
107 RETURN

200 REM ===== update =====
201 FOR X = X0+1 TO XN-1 : FOR Y = Y0+1 TO YN-1
202 N = 0
203 N = N + G%(X-1,Y-1)
204 N = N + G%(X-1,Y)
205 N = N + G%(X-1,Y+1)
206 N = N + G%(X,Y-1)
207 N = N + G%(X,Y+1)
208 N = N + G%(X+1,Y-1)
209 N = N + G%(X+1,Y)
210 N = N + G%(X+1,Y+1)
211 IF G%(X,Y) = LIVE AND N < 2 THEN S%(X,Y) = DEAD
212 IF G%(X,Y) = LIVE AND N > 3 THEN S%(X,Y) = DEAD
213 IF G%(X,Y) = DEAD AND N = 3 THEN S%(X,Y) = LIVE
214 NEXT : NEXT
215 FOR X = X0 TO XN : FOR Y = Y0 TO YN : G%(X,Y) = S%(X,Y) : NEXT : NEXT
216 RETURN

300 REM ===== fill =====
301 FOR LX = X0 TO XN : FOR LY = Y0 TO YN
302 R = RND(1)
303 IF R >= 0.5 THEN G%(LX,LY) = LIVE
304 IF R < 0.5 THEN G%(LX,LY) = DEAD
305 NEXT : NEXT
306 RETURN

1000 REM ===== init =====
1010 X0 = 1 : Y0 = 2 : XN = 38 : YN = 22
1020 DEAD = 0: LIVE = 1
1030 DIM G%(XN, YN) : REM the life grid
1040 DIM S%(XN, YN) : REM the next grid

2000 REM ===== main =====
2010 HOME
2020 PRINT "John Conway's game of LIFE by drKorf"
2030 GOSUB 300
2040 FOR GEN = X0 TO XN:
2050 GOSUB 100
2060 GOSUB 200
2070 NEXT
2090 GOTO 2000
```

## BLIFE ##

```



```
