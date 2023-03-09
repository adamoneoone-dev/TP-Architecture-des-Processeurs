/* Pour l'inclusion des noms des registres spécifiques */
#include <avr/io.h>

	/* Debut de la section .text */
	.section .text

VA:     .byte   0
VB:     .byte   1
	.align 2 /* aligner les instructions sur adresses paires */
	.global	main /* Adresse de debut main */ 

main:	sbi _SFR_IO_ADDR(DDRE), 4 /* Mise à 1 du bit DDRE4 => sortie */
	ldi r30, lo8(VA)
	ldi r31, hi8(VA)
	lpm r20, Z
	ldi r30, lo8(VB)
	ldi r31, hi8(VB)
	lpm r21, Z
	cp r20, r21
	breq allumer
	cbi _SFR_IO_ADDR(PORTE), 4

fin:
	rjmp fin
//========================================================
allumer: 
	sbi _SFR_IO_ADDR(PORTE), 4
	rjmp fin
	.end
