; Wed 20 Sep 16:28:06 UTC 2023
; prints backwards up the screen!

          * = $0300

OUTCH       = $FFEF

REDO      LDA #$20
          STA $3F
          LDA #$00

LOOP      TAX
          JSR OUTCH
          JSR DELAY
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

; 0300: A9 20 85 3F A9 00 AA 20
; 0308: EF FF 20 15 03 E8 8A 4C
; 0310: 06 03 4C 00 03 A0 07 A2
; 0318: 07 60 CA D0 FD 88 D0 FA
; 0320: 60 4C 00 03 4C 15 03

