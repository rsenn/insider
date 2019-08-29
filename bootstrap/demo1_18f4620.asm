;PROGRAM DEMO_18F4620

 LIST P=18F4620, st=OFF
 #include <P18F4620.INC>
 errorlevel	-302
 errorlevel	-305
 radix	dec

 CONFIG	OSC = INTIO7, MCLRE = OFF, PBADEN = OFF, LVP = OFF, WDT = OFF, PWRT = ON


DBRK	EQU	1	;SET BREAKPOINTS-DEBUG ON/OFF 1/0
 noexpand
BREAK	MACRO	bkn	;BREAKPOINT MACRO DEF
 IF DBRK==1
	MOVFF	WREG,DB0
	MOVLW	bkn
	CALL	DBUG
 ENDIF
	ENDM
INSIDER	MACRO		;INSIDER START MACRO DEF
 IF DBRK==1
	CALL	DG000
 ENDIF
	ENDM

;************************************************************************
; DEMO PROGRAM THAT LOADS BYTE 11H TO DATA RAM ADDRESS 0F0H-10FH,
; BYTE 22H TO 1F0H-20FH, BYTE 33H TO 2F0H-30FH, BYTE 44H TO 3F0H-40FH
; BYTE 55H TO 4F0H-50FH, BYTE 66H TO 5F0H-60FH, BYTE 77H TO 6F0H-70FH
; BYTE 88H TO 7F0H-80FH, BYTE 99H TO 8F0H-90FH, BYTE AAH TO 9F0H-A0FH
; BYTE BBH TO AF0H-B0FH, BYTE CCH TO BF0H-C0FH, BYTE DDH TO CF0H-D0FH
; BYTE EEH TO DF0H-E0FH, BYTE FFH TO EF0H-F0FH.
; TO TEST THE INSIDER DISPLAY (D cmd)
; THEN THERE IS LOOP WHERE PORTB BITS:4-5-6-7 CONNECTED TO 4x PUSHBUTTONS ARE
; READ AND IF ANY IS PRESSED (0-INPUT) THE CORRESPONDING LED CONNECTED TO
; PORTB 0-1-2-3 IS TURNED ON.

VAR1	EQU	20H
VAR2	EQU	21H

;**************************************************************

	ORG	00H

;	MOVLW	60H		;4MHz
	MOVLW	70H		;8MHz

;SELECT ONE OF THE ABOVE TO CHOOSE BETWEEN 4MHz OR 8MHZ
;IF NONE IS SELECTED THEN 1MHz IS THE DEFAULT VALUE

	MOVWF	OSCCON		;SET INTERNAL CLOCK DIVIDER

	BSF	OSCTUNE,PLLEN	;4XCLOCK MODE, COMMENT THIS LINE IF YOU WANT 1X


LBLX	BTFSS	OSCCON,OSTS
	BRA	LBLX
LBLY	BTFSS	OSCCON,IOFS
	BRA	LBLY

	MOVLW	00
	MOVWF	TRISD		;PORTD OUTPUT

	MOVLW	0F0H
	MOVWF	TRISB		;RB7-4 INPUT, RB3-0 OUTPUT

;**************************** TEST OUTPUT SERIAL STRING


	MOVLW	0FFH
	MOVWF	PORTB		;INIT PORT '1'



	INSIDER		;INSIDER START MACRO LINE THAT STOPS THE CODE
			;EXECUTION TO WAIT FOR THE USER G cmd TO START



	LFSR	0,0F0H
	MOVLW	11H
	RCALL	SAVEF
	LFSR	0,1F0H
	MOVLW	22H
	RCALL	SAVEF
	LFSR	0,2F0H
	MOVLW	33H
	RCALL	SAVEF
	LFSR	0,3F0H
	MOVLW	44H
	RCALL	SAVEF
	LFSR	0,4F0H


	BREAK	19H		;BREAK HERE TO CHECK THE DATA RAM WITH 
				;INSIDER cmd: DF0.10F 2F0.30F 7F0.80F BF0.C0F(CR)



	MOVLW	55H
	RCALL	SAVEF
	LFSR	0,5F0H
	MOVLW	66H
	RCALL	SAVEF
	LFSR	0,6F0H
	MOVLW	77H
	RCALL	SAVEF
	LFSR	0,7F0H
	MOVLW	88H
	RCALL	SAVEF
	LFSR	0,8F0H
	MOVLW	99H
	RCALL	SAVEF
	LFSR	0,9F0H
	MOVLW	0AAH
	RCALL	SAVEF
	LFSR	0,0AF0H
	MOVLW	0BBH
	RCALL	SAVEF
	LFSR	0,0BF0H
	MOVLW	0CCH
	RCALL	SAVEF
	LFSR	0,0CF0H
	MOVLW	0DDH
	RCALL	SAVEF
	LFSR	0,0DF0H
	MOVLW	0EEH
	RCALL	SAVEF
	LFSR	0,0EF0H
	MOVLW	0FFH
	RCALL	SAVEF


LBL1	MOVF	PORTB,W		;READ  KEY PRESS -> BIT 4-7


	BREAK	20H		;BREAK HERE TO CHECK THE DATA RAM WITH 
				;INSIDER cmd: D(CR)


	MOVWF	VAR1,A
	IORLW	0FH
	XORLW	0FFH
	BZ	LBL1


	BREAK	31H		;BREAKE HERE AFTER ANY KEY PRESSED IN W



	MOVLW	0FFH
	MOVWF	VAR2,A		;SET VAR2-> FFH
	BTFSS	VAR1,4,A	;SET LEDS
	BCF	VAR2,0,A
	BTFSS	VAR1,5,A
	BCF	VAR2,1,A
	BTFSS	VAR1,6,A
	BCF	VAR2,2,A
	BTFSS	VAR1,7,A
	BCF	VAR2,3,A
	MOVF	VAR2,W,A
	MOVWF	PORTB

	GOTO	LBL1

SAVEF	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	MOVWF	POSTINC0
	BCF	PORTD,2
	MOVWF	POSTINC0
	BSF	PORTD,2
	RETURN


 IF DBRK==1	;18FDBUG: -- DEBUG INSIDER -- TARGET ROUTINE VR 1.0

DB0	EQU	0F7FH
DB1	EQU	0F7EH
DB2	EQU	0F7DH
DB3	EQU	0F7CH
DB4	EQU	0F7BH
DB5	EQU	0F7AH
DB6	EQU	0F79H

;************** USER-PROG DEBUG PIN/PORT INITIALIZED FOR DIGITAL I/O
PIN	EQU	2		;DEBUG PIN     -- USER SELECTED I/O  PIN
#DEFINE X	PORTD,PIN	;DEBUG PORT    -- USER SELECTED CPU PORT-REG
#DEFINE T	TRISD,PIN	;TRIS REG NAME -- USER SELECTED CPU TRIS-REG
DBN	EQU	1	   	;SPEED MULTIPLIER: (1x), 2x, 4x, 8x

	ORG	10000H-.396	;USER SELECTED END_PROG_MEM - DBUG(BYTES)
;CHECK CPU TYPE - BE CAREFUL WITH CONFIG-BYTES AT THE END OF PROG-MEM

DG000	BSF	X,0
	BCF	T,0
	BTFSC	X,0
	BRA	$-2
	BTFSS	X,0
	BRA	$-2
	MOVFF	WREG,DB0
	MOVLW	DBN
DBUG	MOVFF	INTCON,DB1
	BCF	INTCON,GIE,0
	MOVFF	STATUS,DB2
	MOVFF	FSR0L,DB3
	MOVFF	FSR0H,DB4
	MOVWF	FSR0L,0
	BSF	X,0
	BCF	T,0
	MOVLW	.10
	MOVWF	FSR0H,0
	RCALL	$+.342
	BCF	X,0
	MOVLW	.258-.64/DBN
	RCALL	$+.336
	MOVLW	.258-.128/DBN
	BRA	$+.18
	RCALL	$+.330
	MOVLW	.258-.64/DBN
	BCF	X,0
	RCALL	$+.324
	RRCF	FSR0L,1,0
	MOVLW	.258-.160/DBN
	BC	$+4
	MOVLW	.258-.96/DBN
	BSF	X,0
	DECFSZ	FSR0H,1,0
	BRA	$-.20
	BSF	T,0
	RCALL	$+.274
	BTFSS	FSR0L,7,0
	BRA	$+.46
	BTFSS	FSR0L,6,0
	BRA	$+.20
	MOVF	FSR0L,W,0
	MOVWF	TOSU,0
	RCALL	$+.260
	MOVF	FSR0L,W,0	
	MOVWF	TOSH,0
	RCALL	$+.254
	BCF	FSR0L,0,0
	MOVF	FSR0L,W,0
	MOVWF	TOSL,0
	MOVFF	DB0,WREG
	MOVFF	DB4,FSR0H
	MOVFF	DB3,FSR0L
	MOVFF	DB2,STATUS
	MOVFF	DB1,INTCON
	RETURN
	MOVFF	FSR0L,DB5
	BTFSC	FSR0L,4,0
	BTFSS	FSR0L,5,0
	BRA	$+.50
	RCALL	$+.214
	MOVFF	EEADRH,FSR0H
	MOVFF	DB5,EEADRH
	MOVFF	EEADR,DB5
	MOVFF	FSR0L,EEADR
	MOVFF	EEDATA,FSR0L
	MOVF	EECON1,W,0
	BCF	EECON1,7,0
	BCF	EECON1,6,0
	BSF	EECON1,0,0
	MOVWF	EECON1,0
	MOVFF	FSR0H,EEADRH
	MOVFF	DB5,EEADR
	MOVF	EEDATA,W,0
	MOVFF	FSR0L,EEDATA
	BRA	$-.152
	BTFSC	FSR0L,4,0
	BRA	$+.24
	BTFSC	FSR0L,5,0
	BRA	$+.30
	RCALL	$+.158
	MOVFF	DB5,WREG
	XORLW	HIGH WREG
	ANDLW	0FH
	BNZ	$+.52
	MOVLW	LOW WREG
	XORWF	FSR0L,W,0
	BNZ	$+6
	MOVLW	LOW DB0
	BRA	$+.84
	MOVLW	LOW STATUS
	XORWF	FSR0L,W,0
	BNZ	$+6
	MOVLW	LOW DB2
	BRA	$+.74
	MOVLW	LOW INTCON
	XORWF	FSR0L,W,0
	BNZ	$+6
	MOVLW	LOW DB1
	BRA	$+.64
	MOVLW	LOW FSR0L
	XORWF	FSR0L,W,0
	BNZ	$+6
	MOVLW	LOW DB3
	BRA	$+.54
	MOVLW	LOW FSR0H
	XORWF	FSR0L,W,0
	BNZ	$+6
	MOVLW	LOW DB4
	BRA	$+.44
	MOVFF	DB5,WREG
	XORLW	HIGH DB0
	ANDLW	0FH
	BNZ	$+.48
	MOVLW	LOW DB0
	XORWF	FSR0L,W,0
	BZ	$+.26
	MOVLW	LOW DB1
	XORWF	FSR0L,W,0
	BZ	$+.20
	MOVLW	LOW DB2
	XORWF	FSR0L,W,0
	BZ	$+.14
	MOVLW	LOW DB3
	XORWF	FSR0L,W,0
	BZ	$+8
	MOVLW	LOW DB4
	XORWF	FSR0L,W,0
	BNZ	$+.18
	MOVLW	LOW DB5
	MOVWF	FSR0L,0
	MOVFF	DB5,WREG
	ANDLW	0F0H
	IORLW	HIGH DB5
	MOVFF	WREG,DB5
	MOVFF	FSR0L,DB6
	MOVFF	DB5,FSR0L
	BTFSS	FSR0L,6,0
	BRA	$+.18
	RCALL	$+.28
	MOVF	FSR0L,W,0
	MOVFF	DB6,FSR0L
	MOVFF	DB5,FSR0H
	MOVWF	INDF0,0
	BRA	$-.262
	MOVFF	DB6,FSR0L
	MOVFF	DB5,FSR0H
	MOVF	INDF0,W,0
	BRA	$-.318
	MOVLW	9
	MOVWF	FSR0H,0
	BTFSC	X,0
	BRA	$-2
	BTFSS	X,0
	BRA	$-2
	DECFSZ	FSR0H,1,0
	BRA	$+4
	RETURN
	CLRF	WREG,0
	ADDLW	1
	BTFSC	X,0
	BRA	$-4
	ADDLW	.255-.128/DBN
	RRCF	FSR0L,1,0
	BRA	$-.22
	ADDLW	1
	BZ	$+4
	BRA	$-4
	RETURN
 ENDIF
	END
