; 17:23:22z - 

; wed 20 sep 2023

          * = $0300

OUTCH       = $FFEF

REDO      LDA #$2F  ;  K > A ; PROVEN
          STA $400  ;  A > M ; PROVEN
          LDA #$3B  ;  K > A ; PROVEN
          STA $401  ;  A > M ; PROVEN

          LDA #$2D  ; minus
          JSR OUTCH
          LDA #$39  ; 9
          JSR OUTCH
          LDA #$39
          JSR OUTCH
          LDA #$2C  ; comma
          JSR OUTCH
          LDA #$20  ; space
          JSR OUTCH
          LDA #$41  ;  'A'

LOOP      TAX
          JSR OUTCH ;  A > DSP ; PROVEN
          STX $402  ;  X > M ; somewhat proven
          STY $403  ;  Y > M ; again somewhat proven
          JSR DELAY ;  returns or seems to
          LDX $402  ;  M > X ; might be working
          LDY $403  ;  M > Y ; again might be working
          ; INX
          TXA
          JMP LOOP

          JMP REDO

DELAY     LDY #$C7   ;  K > Y ; unproven
          LDX #$D9   ;  K > X ; unproven
          ; RTS         really should run fine

LOOPD     DEX
          BNE LOOPD
          DEY
          BNE LOOPD
          RTS

          JMP REDO
          JMP DELAY
         .END


; 0300: A9 2F 8D 00 04 A9 3B 8D


; aaa
0300: A9 2F 8D 00 04 A9 3B 8D
0308: 01 04 A9 2D 20 EF FF A9
0310: 39 20 EF FF A9 39 20 EF
0318: FF A9 2C 20 EF FF A9 20
0320: 20 EF FF A9 41 AA 20 EF
0328: FF 8E 02 04 8C 03 04 20
0330: 3F 03 AE 02 04 AC 03 04
0338: 8A 4C 25 03 4C 00 03 A0
0340: C7 A2 D9 CA D0 FD 88 D0
0348: FA 60 4C 00 03 4C 3F 03


; end.

