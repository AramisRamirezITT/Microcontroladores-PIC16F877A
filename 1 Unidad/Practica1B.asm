
; PIC16F15313 Configuration Bit Settings

; Assembly source line config statements

#include "p16f15313.inc"

; CONFIG1
; __config 0xFF8F
 __CONFIG _CONFIG1, _FEXTOSC_ECH & _RSTOSC_HFINT32 & _CLKOUTEN_OFF & _CSWEN_ON & _FCMEN_ON
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _MCLRE_ON & _PWRTE_OFF & _LPBOREN_OFF & _BOREN_ON & _BORV_LO & _ZCD_OFF & _PPS1WAY_ON & _STVREN_ON
; CONFIG3
; __config 0x3F9F
 __CONFIG _CONFIG3, _WDTCPS_WDTCPS_31 & _WDTE_OFF & _WDTCWS_WDTCWS_7 & _WDTCCS_SC
; CONFIG4
; __config 0x3FFF
 __CONFIG _CONFIG4, _BBSIZE_BB512 & _BBEN_OFF & _SAFEN_OFF & _WRTAPP_OFF & _WRTB_OFF & _WRTC_OFF & _WRTSAF_OFF & _LVP_ON
; CONFIG5
; __config 0x3FFF
 __CONFIG _CONFIG5, _CP_OFF
; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR

; <Fecha::Nombre, Ejemplo 2010/01/15::Cuerdas, Juan>
; <Titulo, ejemplo: Practica_1A_HelloWorld>
; <Grupo, Ejemplo, 9A matutino>
; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
;-----------------------------------------------------------------------
; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
;-----------------------------------------------------------------------
RES_VECT CODE 0x0000 ; processor reset vector
 GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
;-----------------------------------------------------------------------
MAIN_PROG CODE ; let linker place main program
;-----------------------------------------------------------------------
 ; Configuracion del micro para la practica
START
 call SETUP

 ; Codigo de la practica
loop_forever
 call LOOP
 goto loop_forever
;-----------------------------------------------------------------------

SETUP       
    
    BANKSEL PORTA 
    CLRF    PORTA 
    BANKSEL LATA 
    CLRF    LATA 
    BANKSEL ANSELA 
    CLRF    ANSELA ;digital I/O
    BANKSEL TRISA 
    MOVLW B'00000011' ; Set int/out 1 = int ; 0 = Out   
    MOVWF TRISA 
    
    
 return
;-----------------------------------------------------------------------
LOOP
    BANKSEL PORTA ;Select PortA
    BTFSC   PORTA, RA0 ; Si el Bit RA0 Es 1 ve a la etiqueta "ELSE_CODE"  
    GOTO    ELSE_CODE ; ve a la etiqueta "ELSE_CODE" 
    BCF	    PORTA, RA5   ; Limpia bit 5 del portA "Apagar Led" 
    GOTO    END_IF ; Ve a etiqueta "END_IF"
    
ELSE_CODE    
    BSF	    PORTA, RA5 ; Set bit 5 del puierto A "Prende Led"
END_IF
    GOTO    LOOP ;"Ciclo ingfinito"

    END

