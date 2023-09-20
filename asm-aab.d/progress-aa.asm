
          * = $0300

OUTCH       = $FFEF

REDO      LDA #$2F  ;  K > A ; PROVEN
          STA $400  ;  A > M ; PROVEN
          LDA #$3B  ;  K > A
          STA $401  ;  A > M
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

; 0300: A9 2F 8D 00 04 A9 3B 8D
; 0308: 01 04 AA 20 EF FF E8 8A
; 0310: 4C 0A 03 4C 00 03 A0 07
; 0318: A2 07 60 CA D0 FD 88 D0
; 0320: FA 60 4C 00 03 4C 16 03

