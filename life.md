## 100% Applesoft LIFE ##

```
10 GOTO 1000

100 REM ===== display board =====
110 FOR X = X0 TO XN: FOR Y = Y0 TO YN
120 HTAB X+1 : VTAB Y+1
130 IF G%(X,Y) = 1 THEN PRINT("*")
140 IF G%(X,Y) = 0 THEN PRINT(" ")
150 NEXT : NEXT
160 PRINT GEN
170 RETURN

200 REM ===== update =====
210 FOR X = X0+1 TO XN-1 : FOR Y = Y0+1 TO YN-1 : N%(X,Y) = G%(X-1,Y-1) + G%(X-1,Y) + G%(X-1,Y+1) + G%(X,Y-1) + G%(X,Y+1) + G%(X+1,Y-1) + G%(X+1,Y) + G%(X+1,Y+1) : NEXT : NEXT
220 FOR X = X0 TO XN : FOR Y = Y0 TO YN:
230 IF G%(X,Y) > 0 AND N%(X,Y) < 2 THEN S%(X,Y) = 0
240 IF G%(X,Y) > 0 AND N%(X,Y) > 3 THEN S%(X,Y) = 0
250 IF G%(X,Y) = 0 AND N%(X,Y) = 3 THEN S%(X,Y) = 1
260 NEXT : NEXT
270 FOR X = X0 TO XN : FOR Y = Y0 TO YN : G%(X,Y) = S%(X,Y) : NEXT : NEXT
280 RETURN

300 REM ===== fill board randomly =====
310 FOR LX = X0 TO XN : FOR LY = Y0 TO YN : G%(LX,LY) = 0 : NEXT : NEXT
320 FOR LX = X0 TO XN : FOR LY = Y0 TO YN
330 IF RND(1) > 0.5 THEN X = INT(XN*RND(1)) : Y = INT(YN*RND(1)) : G%(X,Y) = 1
340 NEXT : NEXT
350 HOME
360 RETURN

1000 REM ===== init =====
1010 X0 = 0 : Y0 = 0 : XN = 20 : YN = 20
1020 X = 0 : Y = 0
1030 GEN = 0
1100 DIM G%(XN, YN) : REM the current/display grid
1110 DIM N%(XN, YN) : REM the neighbor count grid
1120 DIM S%(XN, YN) : REM the status grid (alive or dead)

2000 REM ===== main loop =====
2010 GOSUB 300
2020 GOSUB 100
2030 GOSUB 200
2040 GEN = GEN + 1: IF GEN = 20 THEN GEN = 0 : GOSUB 300
2050 GOTO 2020
```


