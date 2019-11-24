	#include p18f87k22.inc

	extern	UART_Setup, UART_Transmit_Message   ; external UART subroutines
	extern  LCD_Setup, LCD_Write_Message	    ; external LCD subroutines
	extern	LCD_Write_Hex, LCD_Write_Hex_b,movDRAM,LCD_delay_x4us,LCD_Send_Byte_I,LCD_delay_ms	    ; external LCD subroutines
	extern  ADC_Setup, ADC_Read		    ; external ADC routines
	
acs0	udata_acs   ; reserve data space in access ram
counter	    res 1   ; reserve one byte for a counter variable
delay_count res 1   ; reserve one byte for counter in the delay routine
movPattern_top   res 2   ; reserve 2 byte for variable movPattern_top
movPattern_bot   res 2   ; reserve 2 byte for variable movPattern_bot
pattern	    res 1

tables	udata	0x400    ; reserve data anywhere in RAM (here at 0x400)
myArray res 0x80    ; reserve 128 bytes for message data

rst	code	0    ; reset vector
	goto	setup
	
main	code
	; ******* Programme FLASH read Setup Code ***********************
setup	
	
	call	LCD_Setup	; setup LCD
	
	goto	start
	
	; ******* Main programme ****************************************
start 	
	call	SplashScreen
	
	movlw	b'10000000'
	movwf	movPattern_top
	
	movlw	b'01000001' 
	movwf	0x10
	
	movlw	b'01000010'
	movwf	0x11
	
	movlw	b'01000011' 
	movwf	0x12
	
	movlw	b'01000100' 
	movwf	0x13
	
	movlw	b'01000101' 
	movwf	0x14
	
	movlw	b'01000110' 
	movwf	0x15
	
	movlw	b'01000111' 
	movwf	0x16
	
	
	;movlw	b'00000101'	; entry mode incr by 1, shift
	;call	LCD_Send_Byte_I
	;movlw	.10		; wait 40us
	;call	LCD_delay_x4us
	
	;movlw	b'10001111'
	movlw	b'10000000'
	call	movDRAM

	lfsr	FSR0, 0x010
	
	movlw	.7 
	movwf	0x61
	
	;movf	movPattern_top,w
	;call	movDRAM
	
display_loop
	call	LCD_delay_1
	call	display_test

	decfsz	0x61
	goto	display_loop		; goto current line in code
	goto	0x0

	; a delay subroutine if you need one, times around loop in delay_count
delay	decfsz	delay_count	; decrement until zero
	bra delay
	return
	
display_fixed
	movlw	b'10001110' ;for top bracket symbol
	call	movDRAM
	movlw	b'00010101' 
	call	LCD_Write_Hex_b
	
	movlw	b'11001110';for bottom bracket symbol
	call	movDRAM
	movlw	b'00010101' 
	call	LCD_Write_Hex_b
	
	movf	movPattern_top,w
	call	movDRAM
	return

display_space;in binary 
	movlw	b'00100000'
	call	LCD_Write_Hex_b
	return
display_test;in hex, adds 3 spaces after
	call	display_space
	movf	POSTINC0,w
	call	LCD_Write_Hex_b
	

	return

LCD_delay_1;more nested loop to show it down
	movlw	.1  ;0.5s delay
	movwf	0x151
lcdlp2_1
	movlw	.250
	movwf	0x152
lcdlp2	movlw	.250	    ; 1 ms delay
	call	LCD_delay_x4us	
	decfsz	0x152
	bra	lcdlp2
	decfsz	0x151
	bra	lcdlp2_1
	return

resetdisplayPos;moves to 00 and 40 on top and bottom on display  
	movlw	b'10000000'
	movwf	movPattern_top
	movlw	b'11000000'
	movwf	movPattern_bot
	return

SplashScreen; splash screen at the beginning of the game:
	movlw	b'10000000'
	call	movDRAM
	
	;movlw	b'10000000'
	;call	movDRAM
	
	movlw	b'01000010';B
	call	LCD_Write_Hex_b
	
	movlw	b'01000001';A
	call	LCD_Write_Hex_b
	
	movlw	b'01010011';S
	call	LCD_Write_Hex_b
	
	movlw	b'01010011';S
	call	LCD_Write_Hex_b
	
	movlw	b'00100000'
	call	LCD_Write_Hex_b
	
	movlw	b'01000011';C
	call	LCD_Write_Hex_b
	
	movlw	b'01001000';H
	call	LCD_Write_Hex_b
	
	movlw	b'01000001';A
	call	LCD_Write_Hex_b
	
	movlw	b'01001101';M
	call	LCD_Write_Hex_b
	
	movlw	b'01010000';P
	call	LCD_Write_Hex_b
	
	movlw	b'01001001';I
	call	LCD_Write_Hex_b
	
	movlw	b'01001111';O
	call	LCD_Write_Hex_b
	
	movlw	b'01001110';N
	call	LCD_Write_Hex_b
	
	
	
	
	call	LCD_delay_1

	
	

	
	return

	end