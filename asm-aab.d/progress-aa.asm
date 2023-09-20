; 17:29:53z -  ONLINE edit

; wed 20 sep 2023

          * = $0300

OUTCH       = $FFEF


PREPRINT
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
          RTS

REDO      LDA #$2F  ;  K > A ; PROVEN
          STA $400  ;  A > M ; PROVEN
          LDA #$3B  ;  K > A ; PROVEN
          STA $401  ;  A > M ; PROVEN

          JSR PREPRINT

          LDA #$41  ;  'Q'

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

; end.

0300: A9 2D 20 EF FF A9 39 20
0308: EF FF A9 39 20 EF FF A9
0310: 2C 20 EF FF A9 20 20 EF
0318: FF 60 A9 2F 8D 00 04 A9
0320: 3B 8D 01 04 20 00 03 A9
0328: 41 AA 20 EF FF 8E 02 04
0330: 8C 03 04 20 43 03 AE 02
0338: 04 AC 03 04 8A 4C 29 03
0340: 4C 1A 03 A0 C7 A2 D9 CA
0348: D0 FD 88 D0 FA 60 4C 1A
0350: 03 4C 43 03

