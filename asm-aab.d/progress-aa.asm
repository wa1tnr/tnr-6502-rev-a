
          * = $0300

OUTCH       = $FFEF

REDO      LDA #$2F  ;  K > A
          STA $400  ;  A > M

LOOP      TAX
          JSR OUTCH
;         JSR DELAY
          INX
          TXA
          JMP LOOP
          JMP REDO

DELAY     LDY #$7
          LDX #$7
          RTS

LOOPD     DEX
          BNE LOOPD
          DEY
          BNE LOOPD
          RTS

          JMP REDO
          JMP DELAY
         .END

0300: A9 2F 8D 00 04 AA 20 EF
0308: FF E8 8A 4C 05 03 4C 00
0310: 03 A0 07 A2 07 60 CA D0
0318: FD 88 D0 FA 60 4C 00 03
0320: 4C 11 03

