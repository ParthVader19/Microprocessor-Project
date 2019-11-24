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
N_pattern   res 2   ; reserve 2 byte for variable number of pattern
   


tables	udata	0x400    ; reserve data anywhere in RAM (here at 0x400)
myArray res 0x80    ; reserve 128 bytes for message data

rst	code	0    ; reset vector
	goto	setup
	
main	code
	; ******* Programme FLASH read Setup Code ***********************
setup	
	
	call	LCD_Setup	; setup LCD
	movlw	0x0		;sets the counter for display pattern to 0
	movwf	0x0F0
	movlw	0x0		;sets the counter for button pattern to 0
	movwf	0x0F1
	
	movlw	0xff		;setting portD to input
	movwf	TRISD
	
	goto	start
	
	; ******* Main programme ****************************************
start 	movlw	0x01;starting at one, but when displayed, it is subtracted by 1.
	movwf	0x077;total score
	
	movlw	0x00
	movwf	0x078
	
	movlw	0x00
	movwf	0x079
	
	movlw	0xB
	movwf	0x080
	
	movlw	0xA
	movwf	0x081
	
	call	SplashScreen; splashscreen displays the game name.
			    ;need to make it more FANCY! ideas:
			    ;-Name scroll onto screen (easy)
			    ;-name flashes (easy)
			    ;having a button press screen to start the game (easy-medium)
	
	call	resetdisplayPos 
	
	lfsr	FSR0, 0x010;FSR0 used to store the display pattern in a convient way
	lfsr	FSR1, 0x090;FSR1 used to store the button pressed pattern in a convient way
	
	call	Space_pattern;starting with spaces so players have time to recognise the actual first pattern
	call	Space_pattern
	call	Space_pattern
	call	Space_pattern
	call	Space_pattern
	
	
	call	     Space_pattern;patterns for Wonderwall as composed by Val
	Call         A_pattern
	Call         Space_pattern
	Call         Space_pattern
	Call         Space_pattern
	Call         A_pattern
	Call         Space_pattern
	Call         Space_pattern
	Call         Space_pattern
	Call         A_pattern
	Call         B_pattern
	Call         A_pattern
	Call         B_pattern
	Call         C_pattern
	Call         Space_pattern
	Call         C_pattern
	Call         Space_pattern
	Call         C_pattern
	Call         B_pattern
	Call         C_pattern
	Call         B_pattern
	Call         D_pattern
	Call         Space_pattern
	Call         D_pattern
	Call         Space_pattern
	Call         B_pattern
	Call         D_pattern
	Call         B_pattern
	Call         D_pattern
	Call         A_pattern
	Call         Space_pattern
	Call         A_pattern
	Call         Space_pattern
	Call         A_pattern
	Call         B_pattern
	Call         A_pattern
	Call         B_pattern
	Call         D_pattern
	Call         C_pattern
	Call         B_pattern
	Call         A_pattern
	Call         D_pattern
	Call         Space_pattern
	Call         C_pattern
	Call         Space_pattern
	Call         B_pattern
	Call         Space_pattern
	Call         A_pattern
	Call         Space_pattern
	
	call	Space_pattern;spaces at the end to make it seem that the pattern scrolls off the display.
	call	Space_pattern
	call	Space_pattern
	call	Space_pattern
	call	Space_pattern
	call	Space_pattern
	
	movlw	0x05		;takes away 5 from the number of patterns to stop the loop when the last pattern is in the play region.
	subwf	0x0F1,1
	
	;display logic:
internal_display_pat

	call	resetdisplayPos
	movf	movPattern_top,w;moves DRAM to 0x00
	call	movDRAM
	
	movlw	.6 ; number of patterns being displayed at a given time (on the display, 6 patterns will be displayed due to spacing, the extra pattern will be displayed off screen)
	movwf	0x61
	
	lfsr	FSR0, 0x010;loaded the first pattern into FSR0
	call	LCD_delay_1
	call	display_fixed;displays all the fixed symbols on the screen, like "SCORE:" etc. Having it here in the loop poses a problem:
				; the new score will be updated in the next loop, i.e. if in the current loop the user scores a point,
				; the score display will be displayed in the next loop (not live updated!). fix (medium)
	
display_loop_FSR0
	call	display_test; displays the pattern that is in POSTINC0
	
	movlw	0x03
	addwf	movPattern_top, 1; adds 3 to Dram position of the top line
	movf	movPattern_top,w
	call	movDRAM; move the cursor to Dram position of the top line
	
	
	decfsz	0x61
	bra	display_loop_FSR0		; loops the display 3 times
	
	call	LCD_delay_1
	call	LCD_delay_1
	movf	PORTD,w	;takes input from the buttons
	cpfseq	0x090,1 ;compares button pressed to the expected button pressed 
	call	incorrect;if incorrect button  pressed, takes away 1 point from total score
	
	movlw	0x01;adds 1 point to the total score.
	addwf	0x077,1
	
	movf	0x080,w
	cpfseq	0x077,1
	call	sub10;add 9 to the 1st digit in the score, subtract 1 to the 2nd digit 
	
	call	add10;subtract 9 from the 1st digit in the score, add 1 to the 2nd digit
	
	movf	0x081,w
	cpfseq	0x078,1
	call	sub100;add 9 to the 2nd digit in the score, subtract 1 to the 3rd digit 
	
	call	add100;subtract 9 to the 2nd digit in the score, add 1 to the 3rd digit 
	
	
	call	LCD_delay_1
	call	LCD_delay_1
	
	;shifting display pattern loop logic 
	movff	0x0F0,0x62  ;moves the number of display patterns into 0x62
	
	lfsr	FSR1, 0x010 ;loads the 1st display pattern into FSR1
	lfsr	FSR2, 0x011;loads the 2nd display pattern into FSR2
	
	;call	resetdisplayPos; shift the Dram position back to start to begin next loop.
shift_display ;this routine shifts the value of a given register to a lower register i.e. 0x11->0x10, 0x12->0x11, etc.
	
	movff	POSTINC2,POSTINC1	
	decfsz	0x62
	bra	shift_display
	
	decfsz	0x0F0; less shift_display loops need to be run as the game progress as less number of patterns remain 
	;;;;;;;;;;
	nop
	
	;shifting match pattern loop logic  It is identical in logic to shifting display pattern loop logic .
	movff	0x0F1,0x67
	
	
	lfsr	FSR1, 0x090
	lfsr	FSR2, 0x091
	
shift_pattern
	movff	POSTINC2,POSTINC1
		
	decfsz	0x67
	bra	shift_pattern
	
	decfsz	0x0F1
	;;;;;;;;
	bra	internal_display_pat
	call	display_end_screen; when all patterns are displayed, endscreen is displayed
	goto	start

incorrect; subtracts 1 from the total score
	movlw	0x01
	subwf	0x077,1
	return
	
sub10	
	movlw	0xA
	addwf	0x077,1
	
	movlw	0x1
	subwf	0x078,1
	return

add10
	movlw	0xA
	subwf	0x077,1
	
	movlw	0x1
	addwf	0x078,1
	return

sub100
	movlw	0xA
	addwf	0x078,1
	
	movlw	0x1
	subwf	0x079,1
	return

add100
	movlw	0xA
	subwf	0x078,1
	
	movlw	0x1
	addwf	0x079,1
	return
	
display_fixed; displays symboles on screen that are fixed (in position)
	movlw	b'10000001' ;for top bracket symbol
	call	movDRAM
	movlw	b'00010101' 
	call	LCD_Write_Hex_b
	
	movlw	b'11000000' ;"SCORE:"
	call	movDRAM
	
	movlw	b'01010011' ;S 
	call	LCD_Write_Hex_b
	movlw	b'01000011' ;C
	call	LCD_Write_Hex_b
	movlw	b'01001111' ;O 
	call	LCD_Write_Hex_b
	movlw	b'01010010' ;R 
	call	LCD_Write_Hex_b
	movlw	b'01000101' ;E 
	call	LCD_Write_Hex_b
	movlw	b'00111010' ;: 
	call	LCD_Write_Hex_b
	
	movf	0x079,w
	call	LCD_Write_Hex
	
	movf	0x078,w
	call	LCD_Write_Hex
	
	movff	0x077,N_pattern
	movlw	0x01
	subwf	N_pattern,0
	call	LCD_Write_Hex
				
	
	
	
	
	call	resetdisplayPos
	movf	movPattern_top,w;moves DRAM to 0x00
	call	movDRAM
	return

display_space; space symbole in binary 
	movlw	b'00100000'
	call	LCD_Write_Hex_b
	return
display_test; displays the pattern 
	movf	POSTINC0,w
	call	LCD_Write_Hex_b
	
	return
	
;Potential addition: difficulty levels (medium):
	;Easy: slow scroll speed
	;medium: faster scroll speed (reduce the time for the delay; look at $$)
LCD_delay_1;more nested loop to slow  it down
	;movlw	.2  ;0.5s delay; $$
	movlw	.1
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

resetdisplayPos;moves to position 00 on  top and 40 on bottom on display  
	movlw	b'10000000'
	movwf	movPattern_top
	movlw	b'11000000'
	movwf	movPattern_bot
	return

SplashScreen; splash screen at the beginning of the game:
	call	erase_all
	
	call	resetdisplayPos	
	movf	movPattern_top,w;moves DRAM to 0x00
	call	movDRAM
	
	movlw	b'01000010';B
	call	LCD_Write_Hex_b
	
	movlw	b'01000001';A
	call	LCD_Write_Hex_b
	
	movlw	b'01010011';S
	call	LCD_Write_Hex_b
	
	movlw	b'01010011';S
	call	LCD_Write_Hex_b
	
	;movlw	b'00100000' ;space
	;call	LCD_Write_Hex_b
	
	movf	movPattern_bot,w;moves DRAM to 0x00
	call	movDRAM
	
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
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	
	call	erase_all
	
	
	return
	
	
erase_all
	movlw	.70  ;0.5s delay
	movwf	0x65
	call	resetdisplayPos	
	movf	movPattern_top,w;moves DRAM to 0x00
	call	movDRAM
erase_loop
	call	display_space
	decfsz	0x65
	bra	erase_loop
	
	call	resetdisplayPos	
	movf	movPattern_top,w;moves DRAM to 0x00
	call	movDRAM
	return
	
display_end_screen
	call	erase_all
	movlw	b'01010100';T
	call	LCD_Write_Hex_b
	movlw	b'01001111';O
	call	LCD_Write_Hex_b
	movlw	b'01010100';T
	call	LCD_Write_Hex_b
	movlw	b'01000001';A
	call	LCD_Write_Hex_b
	movlw	b'01001100';L
	call	LCD_Write_Hex_b
	
	movf	movPattern_bot,w;moves DRAM to 0x00
	call	movDRAM
	
	movlw	b'01010011' ;S 
	call	LCD_Write_Hex_b
	movlw	b'01000011' ;C
	call	LCD_Write_Hex_b
	movlw	b'01001111' ;O 
	call	LCD_Write_Hex_b
	movlw	b'01010010' ;R 
	call	LCD_Write_Hex_b
	movlw	b'01000101' ;E 
	call	LCD_Write_Hex_b
	movlw	b'00111010' ;: 
	call	LCD_Write_Hex_b
	
	movf	0x079,w
	call	LCD_Write_Hex
	
	movf	0x078,w
	call	LCD_Write_Hex
	
	movff	0x077,N_pattern
	movlw	0x01
	subwf	N_pattern,0
	call	LCD_Write_Hex
	
	
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	call	LCD_delay_1
	
	return
	
A_pattern
	movlw	b'01000001' ;A
	;movlw	0xA ;for testing 
	movwf	POSTINC0
	movlw	0x01
	addwf	0x0F0,1
	
	movlw	b'11111110';the button pressed pattern for A
	movwf	POSTINC1
	movlw	0x01
	addwf	0x0F1,1
	return
B_pattern
	movlw	b'01000010';B
	;movlw	0xB ;for testing
	movwf	POSTINC0
	movlw	0x01
	addwf	0x0F0,1
	
	movlw	b'11111101';the button pressed pattern for B
	movwf	POSTINC1
	movlw	0x01
	addwf	0x0F1,1
	return
C_pattern
	movlw	b'01000011' ;C
	;movlw	0xC ;for testing
	movwf	POSTINC0
	movlw	0x01
	addwf	0x0F0,1
	
	movlw	b'11111011';the button pressed pattern for C
	movwf	POSTINC1
	movlw	0x01
	addwf	0x0F1,1
	return
D_pattern
	movlw	b'01000100' ;D
	;movlw	0xD ;for testing
	movwf	POSTINC0
	movlw	0x01
	addwf	0x0F0,1
	
	movlw	b'11110111';the button pressed pattern for D
	movwf	POSTINC1
	movlw	0x01
	addwf	0x0F1,1
	return
Space_pattern
	movlw	b'00100000' ;space
	;movlw	0xA1 ;for testing
	movwf	POSTINC0
	movlw	0x01
	addwf	0x0F0,1
	
	movlw	b'00000000';the button pressed pattern for "space". This is not possi
	movwf	POSTINC1
	movlw	0x01
	addwf	0x0F1,1
	return
	
	
	end