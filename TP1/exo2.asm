@ ;====================================================================
@ ; Main.asm file generated by New Project wizard
@ ;
@ ; Created:   dim. févr. 26 2023
@ ; Processor: ATmega2560
@ ; Compiler:  AVRASM (Proteus)
@ ;====================================================================

@ ;====================================================================
@ ; DEFINITIONS
@ ;====================================================================

@ ;====================================================================
@ ; VARIABLES
@ ;====================================================================

@ ;====================================================================
@ ; RESET and INTERRUPT VECTORS
@ ;====================================================================

@ ; Reset Vector
@ rjmp  Start
@ ;====================================================================
@ ; CODE SEGMENT
@ ;====================================================================

@ Start:sbi DDRB, 5
@       sbi DDRB, 0
@       sbi PORTB, 0

@ Loop:
@       in r20, PINB
@       ldi r17, 1
@       cp r20, r17
@       breq clign
@       cbi PORTB, 5
@ rjmp Loop
@ ;====================================================================

@ ;====================================================================
@ tempo1: 
@       push r16
@       push r17
@       ldi r16, 255
@ b1:   ldi r17, 255
@ b2:   subi r17, 1
@       brne b2
@       subi r16, 1
@       brne b1
@       pop r17
@       pop r16
@       ret

@ tempo2: 
@       push r16
@       ldi r16, 1
@ b3:   call tempo1
@       subi r16, 1
@       brne b3
@       pop r16
@       ret      

@ clign: 
@       sbi PORTB, 5
@       call tempo2
@       cbi PORTB, 5
@       call tempo2
@       rjmp Loop

;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   dim. févr. 26 2023
; Processor: ATmega2560
; Compiler:  AVRASM (Proteus)
;====================================================================

;====================================================================
; DEFINITIONS
;====================================================================

;====================================================================
; VARIABLES
;====================================================================

;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================
; Reset Vector
rjmp  Start
;====================================================================
; CODE SEGMENT
;====================================================================

Start:sbi DDRB, 5
      sbi DDRB, 0
      sbi PORTB, 0

Loop:
      in r20, PINB
      andi r20, 1
      ldi r17, 1
      cp r20, r17
      breq clign
      cbi PORTB, 5
rjmp Loop
;====================================================================

;====================================================================
tempo1: 
      push r16
      push r17
      push r18
      ldi r18, 1
b3:   ldi r17, 255
b2:   ldi r16, 255
b1:   subi r16, 1
      brne b1
      subi r17, 1
      brne b2
      subi r18, 1
      brne b3
      pop r18
      pop r17
      pop r16
      ret

clign: 
      sbi PORTB, 5
      call tempo1
      cbi PORTB, 5
      call tempo1
      rjmp Loop
