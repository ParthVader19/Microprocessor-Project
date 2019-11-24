	#include p18f87k22.inc

	;extern	;DAC_Setup, long_delay, delay, small_delay, baby_delay
	
rst	code	0x0000	; reset vector
	goto	start
reserve	
main	code
start	movlw	0x0
	movwf	0x30		    ; reset score
	
	movlw	0xD		    ; set pattern
	movwf	0x20, ACCESS	    ; store in 0x20
	movlw	0xA		    ; set pattern
	movwf	0x21, ACCESS	    ; store in 0x21
	movlw	0xD		    ; set pattern
	movwf	0x22, ACCESS	    ; store in 0x22
	movlw	0xF		    ; set pattern
	movwf	0x23, ACCESS	    ; store in 0x23
	movlw	0xB		    ; set pattern
	movwf	0x24, ACCESS	    ; store in 0x24
	movlw	0xC		    ; set pattern
	movwf	0x25, ACCESS	    ; store in 0x25
	movlw	0xF		    ; set pattern
	movwf	0x26, ACCESS	    ; store in 0x26
	movlw	0xA		    ; set pattern
	movwf	0x27, ACCESS	    ; store in 0x27
	movlw	0xD		    ; set pattern
	movwf	0x28, ACCESS	    ; store in 0x28
	movlw	0xD		    ; set pattern
	movwf	0x29, ACCESS	    ; store in 0x29
	movlw	0xA		    ; set pattern
	movwf	0x2A, ACCESS	    ; store in 0x2A
	movlw	0xD		    ; set pattern
	movwf	0x2B, ACCESS	    ; store in 0x2B
	movlw	0xF		    ; set pattern
	movwf	0x2C, ACCESS	    ; store in 0x2C
	movlw	0xB		    ; set pattern
	movwf	0x2D, ACCESS	    ; store in 0x2D
	movlw	0xC		    ; set pattern
	movwf	0x2E, ACCESS	    ; store in 0x2E
	movlw	0xF		    ; set pattern
	movwf	0x2F, ACCESS	    ; store in 0x2F
	nop

	
	movlw 	0x0
	movwf	TRISE, ACCESS	    ; Port E all outputs
	movlw 	0xFF	
	movwf	TRISD, ACCESS	    ; Port D all inputs
	
	movlw	0x0
	movwf	PORTE, ACCESS	    ; clear Port E
	
	;trying to move through block of RAM 0x20 to 0x2F
	lfsr	FSR0, 0x020
game	movf	POSTINC0, W, ACCESS
	movwf	PORTE	    ; display pattern on Port E
	
	call	long_delay
	nop
	
	movf	PORTD, W, ACCESS    ; take input from Port D to W
	movwf	0x50, ACCESS
	comf	0x50, 0, 0
	cpfseq	0x20, 0		    ; compare Port F input to pattern
	bra	youfailed	    
	bra	youwon

	
	goto	0x0

youfailed
	movlw	0x0
	addwf	0x30, 1, 0
	goto	game
	
youwon	movlw	0x01
	addwf	0x30, 1, 0
	goto	game
	




long_delay
	movlw	0xff
	movwf	0x10
	movwf	0x11
	movwf	0x12
count0	call	delay
	decfsz	0x10, 1, 0
	bra	count0                                                                                                                                                 
count1	call	delay
	decfsz	0x11, 1, 0
	bra	count1
count2	call	delay
	decfsz	0x12, 1, 0
	bra	count2
	return
	
delay	movlw	0xff
	movwf	0x13
	movwf	0x14
	movwf	0x15
count3	call	small_delay
	decfsz	0x13, 1, 0
	bra	count3                                                                                                                                                 
count4	call	small_delay
	decfsz	0x14, 1, 0
	bra	count4
count5	call	small_delay
	decfsz	0x15, 1, 0
	bra	count5
	return
	
small_delay
	movlw	0x01
	movwf	0x16
	movwf	0x17
	movwf	0x18
count6	call	baby_delay
	decfsz	0x16, 1, 0
	bra	count6                                                                                                                                                 
count7	call	baby_delay
	decfsz	0x17, 1, 0
	bra	count7
count8	call	baby_delay
	decfsz	0x18, 1, 0
	bra	count8
	return
	
	
	
baby_delay
	movlw	0x03
	movwf	0x19
	movwf	0x1A
	movwf	0x1B
count9	decfsz	0x19, 1, 0
	bra	count9                                                                                                                                                 
countA	decfsz	0x1A, 1, 0
	bra	countA
countB	decfsz	0x1B, 1, 0
	bra	countB
	return

    end