; 21:30:52z -  ONLINE edit

; wed 20 sep 2023

; filters just 'z'

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

          LDA #$52  ;  'R'

LOOP
          STA $404
          LDA #$7A  ; 7E is '~'
          STA $405
          LDA $404
          CMP $405  ; compare acc w '~'
          BCS SKIP  ; promising match

          TAX
          JSR OUTCH ;  A > DSP

          STX $402  ;  X > M
          STY $403  ;  Y > M
          JSR DELAY
          LDX $402  ;  M > X
          LDY $403  ;  M > Y

SKIP
          INX
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
         .END

; end.

; seems to filter out JUST 'z' now  .. nice unintended lesson. ;)
; next:
;   wow.  Truncated all output past the 'z'
;    (which also does not appear)

0300: 4C 31 03 A9 8D 20 EF FF
0308: A9 8D 20 EF FF A9 20 20
0310: EF FF A9 20 20 EF FF A9
0318: 2D 20 EF FF A9 39 20 EF
0320: FF A9 39 20 EF FF A9 2C
0328: 20 EF FF A9 20 20 EF FF
0330: 60 A9 2F 8D 00 04 A9 3B
0338: 8D 01 04 20 03 03 A9 52
0340: 8D 04 04 A9 7A 8D 05 04
0348: AD 04 04 CD 05 04 B0 13
0350: AA 20 EF FF 8E 02 04 8C
0358: 03 04 20 6B 03 AE 02 04
0360: AC 03 04 E8 8A 4C 40 03
0368: 4C 31 03 A0 C7 A2 D9 CA
0370: D0 FD 88 D0 FA 60 EA EA
0378: EA

