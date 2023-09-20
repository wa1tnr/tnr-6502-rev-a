; 17:01:58z - WORKS

; wed 20 sep 2023

          * = $0300

OUTCH       = $FFEF

REDO      LDA #$2F  ;  K > A ; PROVEN
          STA $400  ;  A > M ; PROVEN
          LDA #$3B  ;  K > A ; PROVEN
          STA $401  ;  A > M ; PROVEN

LOOP      TAX
          JSR OUTCH
          STX $402
          STY $403
          JSR DELAY
          LDX $402
          LDY $403
          INX
          TXA
          JMP LOOP

          JMP REDO

DELAY     LDY #$7   ;  K > Y ; unproven
          LDX #$7   ;  K > X ; unproven
          RTS       ;  really should run fine

LOOPD     DEX
          BNE LOOPD
          DEY
          BNE LOOPD
          RTS

          JMP REDO
          JMP DELAY
         .END

; 0300: A9 2F 8D 00 04 A9 3B 8D
; 0308: 01 04 AA 20 EF FF 8E 02
; 0310: 04 8C 03 04 20 25 03 AE
; 0318: 02 04 AC 03 04 E8 8A 4C
; 0320: 0A 03 4C 00 03 A0 07 A2
; 0328: 07 60 CA D0 FD 88 D0 FA
; 0330: 60 4C 00 03 4C 25 03

; end.
