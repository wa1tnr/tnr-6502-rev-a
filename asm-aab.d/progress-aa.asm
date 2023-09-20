; 23:11:44z -  ONLINE edit

; wed 20 sep 2023

          * = $0300

SIGACC      = $0480
SIGACB      = $0481
XSTASH      = $0482
YSTASH      = $0483
ACCMEM      = $0484
CMPOP       = $0485

OUTCH       = $FFEF

BEGIN     JMP REDO

PREPRINT
          LDA #$8D ; CR
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
          LDA #$8D
          JSR OUTCH
          LDA #$8D
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          RTS

REDO      LDA #$2F   ;  K > A
          STA SIGACC ; $0400 A > M
          LDA #$3B
          STA SIGACB ; $0401 A > M
          JSR PREPRINT
          JSR TWPRINT
          LDA #$20
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          LDA #$57  ;  'W'

LOOP      STA ACCMEM ; $0404
          LDA #$7F  ; this char omitted 7E is '~'
          STA CMPOP

          LDA ACCMEM
          CMP CMPOP
          BCS SKIP

          LDA #$1F  ; one below a space
          STA CMPOP

          LDA ACCMEM
          CMP CMPOP
          BCC SKIP  ; less than only

          TAX
          JSR OUTCH ;  A > DSP

          STX XSTASH ; $0402 X > M
          STY YSTASH ; $0403 Y > M
          JSR DELAY
          LDX XSTASH ; $0402 M > X
          LDY YSTASH ; $0403 M > Y

SKIP      INX
          TXA
          JMP LOOP
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

TWPRINT   LDA #$4E ; 'N'
          JSR OUTCH
          LDA #$6F ; 'o'
          JSR OUTCH
          LDA #$77 ; 'w'
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          LDA #$20
          JSR OUTCH
          LDA #$41 ; 'A'
          JSR OUTCH
          LDA #$64 ; 'd'  waterandstir:
          JSR OUTCH
          LDA #$77
          JSR OUTCH
          LDA #$61
          JSR OUTCH
          LDA #$74
          JSR OUTCH
          LDA #$65
          JSR OUTCH
          LDA #$72
          JSR OUTCH
          LDA #$61
          JSR OUTCH
          LDA #$6E
          JSR OUTCH
          LDA #$64
          JSR OUTCH
          LDA #$73
          JSR OUTCH
          LDA #$74
          JSR OUTCH
          LDA #$69
          JSR OUTCH
          LDA #$72
          JSR OUTCH
          LDA #$2E
          JSR OUTCH
          LDA #$63
          JSR OUTCH
          LDA #$6F
          JSR OUTCH
          LDA #$6D
          JSR OUTCH
          LDA #$8D ; CR
          JSR OUTCH
          LDA #$8D
          JSR OUTCH
          RTS
         .END
; end.

0300: 4C 40 03 A9 8D 20 EF FF
0308: A9 8D 20 EF FF A9 20 20
0310: EF FF A9 20 20 EF FF A9
0318: 2D 20 EF FF A9 39 20 EF
0320: FF A9 39 20 EF FF A9 2C
0328: 20 EF FF A9 8D 20 EF FF
0330: A9 8D 20 EF FF A9 20 20
0338: EF FF A9 20 20 EF FF 60
0340: A9 2F 8D 80 04 A9 3B 8D
0348: 81 04 20 03 03 20 9F 03
0350: A9 20 20 EF FF A9 20 20
0358: EF FF A9 57 8D 84 04 A9
0360: 7F 8D 85 04 AD 84 04 CD
0368: 85 04 B0 20 A9 1F 8D 85
0370: 04 AD 84 04 CD 85 04 90
0378: 13 AA 20 EF FF 8E 82 04
0380: 8C 83 04 20 91 03 AE 82
0388: 04 AC 83 04 E8 8A 4C 5C
0390: 03 A0 C7 A2 D9 CA D0 FD
0398: 88 D0 FA 60 EA EA EA A9
03A0: 4E 20 EF FF A9 6F 20 EF
03A8: FF A9 77 20 EF FF A9 20
03B0: 20 EF FF A9 20 20 EF FF
03B8: A9 41 20 EF FF A9 64 20
03C0: EF FF A9 77 20 EF FF A9
03C8: 61 20 EF FF A9 74 20 EF
03D0: FF A9 65 20 EF FF A9 72
03D8: 20 EF FF A9 61 20 EF FF
03E0: A9 6E 20 EF FF A9 64 20
03E8: EF FF A9 73 20 EF FF A9
03F0: 74 20 EF FF A9 69 20 EF
03F8: FF A9 72 20 EF FF A9 2E
0400: 20 EF FF A9 63 20 EF FF
0408: A9 6F 20 EF FF A9 6D 20
0410: EF FF A9 8D 20 EF FF A9
0418: 8D 20 EF FF 60

