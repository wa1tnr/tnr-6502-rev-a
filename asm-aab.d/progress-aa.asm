; 18:28:22z - OFFLINE edit

; wed 20 sep 2023

          * = $0300

OUTCH       = $FFEF

BEGIN     JMP REDO

PREPRINT
          LDA #$8D
          JSR OUTCH
          LDA #$8D
          JSR OUTCH
          LDA #$20  ; space
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          LDA #$2D  ; minus
          JSR OUTCH
          LDA #$39  ; 9
          JSR OUTCH
          LDA #$39
          JSR OUTCH
          LDA #$2C  ; comma
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          RTS

REDO      LDA #$2F  ;  K > A
          STA $400  ;  A > M
          LDA #$3B
          STA $401

          JSR PREPRINT

          LDA #$41  ;  'Q'

LOOP      TAX
          JSR OUTCH ;  A > DSP
          STX $402  ;  X > M
          STY $403  ;  Y > M
          JSR DELAY
          LDX $402  ;  M > X
          LDY $403  ;  M > Y
          ; INX
          TXA
          JMP LOOP

          JMP REDO

DELAY     LDY #$C7   ;  K > Y ; unproven
          LDX #$D9   ;  K > X ; unproven

LOOPD     DEX
          BNE LOOPD
          DEY
          BNE LOOPD
          RTS

          NOP
          NOP
          NOP
;          JMP REDO
;          JMP DELAY
         .END

; end.


0300: 4C 31 03 A9 8D 20 EF FF
0308: A9 8D 20 EF FF A9 20 20
0310: EF FF A9 20 20 EF FF A9
0318: 2D 20 EF FF A9 39 20 EF
0320: FF A9 39 20 EF FF A9 2C
0328: 20 EF FF A9 20 20 EF FF
0330: 60 A9 2F 8D 00 04 A9 3B
0338: 8D 01 04 20 03 03 A9 41
0340: AA 20 EF FF 8E 02 04 8C
0348: 03 04 20 5A 03 AE 02 04
0350: AC 03 04 8A 4C 40 03 4C
0358: 31 03 A0 C7 A2 D9 CA D0
0360: FD 88 D0 FA 60 EA EA EA

