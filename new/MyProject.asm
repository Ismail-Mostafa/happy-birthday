
_pause:

;MyProject.c,8 :: 		void pause(unsigned short i){
;MyProject.c,10 :: 		for (j = 0; j < i; j++){
	CLRF       R1+0
L_pause0:
	MOVF       FARG_pause_i+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_pause1
;MyProject.c,11 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_pause3:
	DECFSZ     R13+0, 1
	GOTO       L_pause3
	DECFSZ     R12+0, 1
	GOTO       L_pause3
	NOP
;MyProject.c,10 :: 		for (j = 0; j < i; j++){
	INCF       R1+0, 1
;MyProject.c,12 :: 		}
	GOTO       L_pause0
L_pause1:
;MyProject.c,13 :: 		}
	RETURN
; end of _pause

_main:

;MyProject.c,35 :: 		void main() {
;MyProject.c,36 :: 		TRISB = 0b00001000;  // GP5, 5 I/P's, Rest O/P's
	MOVLW      8
	MOVWF      TRISB+0
;MyProject.c,37 :: 		Sound_Init(&PORTB,0); // Initialize sound o/p pin
	MOVLW      PORTB+0
	MOVWF      FARG_Sound_Init_snd_port+0
	CLRF       FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;MyProject.c,40 :: 		do {
L_main4:
;MyProject.c,41 :: 		for(k = 0; k<25; k++){
	CLRF       _k+0
L_main7:
	MOVLW      25
	SUBWF      _k+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MyProject.c,42 :: 		Sound_Play(notes[k], 100*interval[k]);
	MOVF       _k+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _notes+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVF       _k+0, 0
	ADDLW      _interval+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      100
	MOVWF      R4+0
	CALL       _Mul_8x8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVF       R0+1, 0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;MyProject.c,43 :: 		pause(6);
	MOVLW      6
	MOVWF      FARG_pause_i+0
	CALL       _pause+0
;MyProject.c,41 :: 		for(k = 0; k<25; k++){
	INCF       _k+0, 1
;MyProject.c,44 :: 		}
	GOTO       L_main7
L_main8:
;MyProject.c,45 :: 		pause(100);
	MOVLW      100
	MOVWF      FARG_pause_i+0
	CALL       _pause+0
;MyProject.c,46 :: 		}while(1);
	GOTO       L_main4
;MyProject.c,47 :: 		}
	GOTO       $+0
; end of _main
