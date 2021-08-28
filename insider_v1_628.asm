        processor p16f876a
        radix dec

        include p16f876a.inc

; The recognition of labels and registers is not always good, therefore
; be treated cautiously the results.

;===============================================================================
; DATA address definitions

Common_RAM      equ     0x0070                              ; size: 16 bytes

;===============================================================================
; CODE area

        ; code

        org     __CODE_START                                ; address: 0x0000

vector_reset:                                               ; address: 0x0000

        clrf    0x28                                        ; reg: 0x028

label_001:                                                  ; address: 0x0001

        goto    label_002

label_002:                                                  ; address: 0x0002

        decfsz  0x28, F                                     ; reg: 0x028
        goto    label_001

vector_int:                                                 ; address: 0x0004

        movlw   0x07
        movwf   ADCON0                                      ; reg: 0x01f
        movlw   0xff
        movwf   PORTA                                       ; reg: 0x005
        movwf   PORTB                                       ; reg: 0x006
        movlw   0x66
        call    function_025
        movlw   0x80
        andwf   INDF, F                                     ; reg: 0x000
        movlw   0x90
        movwf   RCSTA                                       ; reg: 0x018
        movlw   0x07
        movwf   PCLATH                                      ; reg: 0x00a
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movlw   0x25
        movwf   RCSTA                                       ; reg: 0x018
        movlw   0x20
        movwf   TXREG                                       ; reg: 0x019
        movlw   0xfc
        movwf   PORTA                                       ; reg: 0x005
        movlw   0xfb
        movwf   PORTB                                       ; reg: 0x006
        bsf     CCPR2H, 0x2                                 ; reg: 0x01c
        clrf    STATUS                                      ; reg: 0x003
        bsf     PORTA, RA0                                  ; reg: 0x005, bit: 0
        bsf     PORTA, RA1                                  ; reg: 0x005, bit: 1
        movlw   0xa6
        call    function_015
        call    function_006

label_004:                                                  ; address: 0x0021

        movlw   0xc3
        call    function_015
        bsf     0x66, 0x1                                   ; reg: 0x066
        call    function_014
        btfss   0x65, 0x6                                   ; reg: 0x065
        goto    label_004
        bcf     0x65, 0x5                                   ; reg: 0x065
        btfss   0x66, 0x4                                   ; reg: 0x066
        goto    label_005
        bcf     0x66, 0x4                                   ; reg: 0x066
        movlw   0x4e
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_087

label_005:                                                  ; address: 0x002f

        movlw   0x48
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_093
        movlw   0x53
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_027
        movlw   0x47
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_083
        movlw   0x56
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_096
        movlw   0x58
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_095
        movlw   0x54
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_094
        btfss   0x66, 0x3                                   ; reg: 0x066
        goto    label_004
        movlw   0x52
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_039
        movlw   0x57
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_046
        movlw   0x44
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_006
        movlw   0x46
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_056
        movlw   0x42
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_066
        movlw   0x45
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_054
        goto    label_004

label_006:                                                  ; address: 0x0062

        movlw   0x6d
        call    function_025
        movwf   0x6b                                        ; reg: 0x06b
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_009
        sublw   0x04
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_007
        clrf    0x6d                                        ; reg: 0x06d
        goto    label_009

label_007:                                                  ; address: 0x006c

        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rlf     0x6b, W                                     ; reg: 0x06b
        movwf   0x6c                                        ; reg: 0x06c
        rlf     0x6c, W                                     ; reg: 0x06c
        addlw   0x6f
        movwf   FSR                                         ; reg: 0x004

label_008:                                                  ; address: 0x0072

        call    function_020
        call    function_026
        call    function_023
        decf    FSR, F                                      ; reg: 0x004
        call    function_026
        call    function_022
        movlw   0x2e
        call    function_024
        decf    FSR, F                                      ; reg: 0x004
        call    function_026
        call    function_023
        decf    FSR, F                                      ; reg: 0x004
        call    function_026
        call    function_022
        decf    FSR, F                                      ; reg: 0x004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_008
        movlw   0x3f
        call    function_024
        call    function_016
        call    function_018
        movlw   0x44
        call    function_024

label_009:                                                  ; address: 0x0089

        call    function_020
        clrf    0x6b                                        ; reg: 0x06b

label_010:                                                  ; address: 0x008b

        movlw   0x08
        xorwf   0x6b, W                                     ; reg: 0x06b
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_014
        call    function_013
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_012
        movlw   0x0f
        andwf   0x6f, F                                     ; reg: 0x06f
        movlw   0x10
        movwf   0x6c                                        ; reg: 0x06c

label_011:                                                  ; address: 0x0096

        movlw   0x6d
        addwf   0x6c, W                                     ; reg: 0x06c
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        incf    FSR, F                                      ; reg: 0x004
        incf    FSR, F                                      ; reg: 0x004
        movwf   INDF                                        ; reg: 0x000
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_011
        incf    0x6b, F                                     ; reg: 0x06b

label_012:                                                  ; address: 0x00a0

        btfss   0x6b, 0x0                                   ; reg: 0x06b
        goto    label_013
        movlw   0x2e
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_010
        goto    label_109

label_013:                                                  ; address: 0x00a7

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_010
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movf    0x6b, W                                     ; reg: 0x06b
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_014
        movf    0x6d, W                                     ; reg: 0x06d
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_004
        movlw   0x1b
        call    function_024
        movlw   0x5b
        call    function_024
        movlw   0x41
        call    function_024
        goto    label_016

label_014:                                                  ; address: 0x00bc

        movlw   0x6d
        movwf   FSR                                         ; reg: 0x004
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x6b, W                                     ; reg: 0x06b
        movwf   INDF                                        ; reg: 0x000
        call    function_027
        rlf     0x6b, F                                     ; reg: 0x06b
        movlw   0x6f
        movwf   FSR                                         ; reg: 0x004

label_015:                                                  ; address: 0x00c5

        incf    FSR, F                                      ; reg: 0x004
        call    function_027
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_015

label_016:                                                  ; address: 0x00c9

        call    function_017
        clrf    0x6b                                        ; reg: 0x06b

label_017:                                                  ; address: 0x00cb

        movf    0x6b, W                                     ; reg: 0x06b
        call    function_023
        call    function_019
        incf    0x6b, F                                     ; reg: 0x06b
        movf    0x6b, W                                     ; reg: 0x06b
        call    function_002
        movlw   0x10
        xorwf   0x6b, W                                     ; reg: 0x06b
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_017

label_018:                                                  ; address: 0x00d5

        movf    0x6d, W                                     ; reg: 0x06d
        movwf   0x6b                                        ; reg: 0x06b
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rlf     0x6b, F                                     ; reg: 0x06b
        rlf     0x6b, F                                     ; reg: 0x06b
        movlw   0x6f
        addwf   0x6b, W                                     ; reg: 0x06b
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        movwf   0x67                                        ; reg: 0x067
        decf    FSR, F                                      ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        movwf   0x68                                        ; reg: 0x068
        decf    FSR, F                                      ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        movwf   0x69                                        ; reg: 0x069
        decf    FSR, F                                      ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        movwf   0x6a                                        ; reg: 0x06a
        movf    0x68, W                                     ; reg: 0x068
        subwf   0x6a, W                                     ; reg: 0x06a
        movf    0x67, W                                     ; reg: 0x067
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x67, W                                     ; reg: 0x067
        subwf   0x69, W                                     ; reg: 0x069
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_019
        movf    0x68, W                                     ; reg: 0x068
        movwf   0x6a                                        ; reg: 0x06a
        movf    0x67, W                                     ; reg: 0x067
        movwf   0x69                                        ; reg: 0x069

label_019:                                                  ; address: 0x00f4

        call    function_016
        movlw   0x40
        movwf   0x64                                        ; reg: 0x064
        movf    0x67, W                                     ; reg: 0x067
        call    function_023
        movlw   0xf0
        andwf   0x68, W                                     ; reg: 0x068
        movwf   0x6b                                        ; reg: 0x06b
        call    function_022
        call    function_019
        btfsc   PIR1, RCIF                                  ; reg: 0x00c, bit: 5
        goto    label_024

label_020:                                                  ; address: 0x0100

        movf    0x6b, W                                     ; reg: 0x06b
        xorwf   0x68, W                                     ; reg: 0x068
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_021
        movlw   0x2d
        call    function_024
        call    function_019
        movlw   0x2e
        call    function_001
        incf    0x6b, F                                     ; reg: 0x06b
        movf    0x6b, W                                     ; reg: 0x06b
        call    function_002
        goto    label_020

label_021:                                                  ; address: 0x010d

        movlw   0x0f
        andwf   0x67, W                                     ; reg: 0x067
        btfsc   0x66, 0x4                                   ; reg: 0x066
        iorlw   0x30
        call    function_011
        movf    0x68, W                                     ; reg: 0x068
        call    function_009
        call    function_007
        movf    0x20, W                                     ; reg: 0x020
        call    function_001
        call    function_022
        call    function_020
        movf    0x6a, W                                     ; reg: 0x06a
        subwf   0x68, W                                     ; reg: 0x068
        movf    0x69, W                                     ; reg: 0x069
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x69, W                                     ; reg: 0x069
        subwf   0x67, W                                     ; reg: 0x067
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_025

label_022:                                                  ; address: 0x0121

        incf    0x68, F                                     ; reg: 0x068
        movf    0x68, W                                     ; reg: 0x068
        call    function_002
        movlw   0x0f
        andwf   0x68, W                                     ; reg: 0x068
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_023
        movlw   0x2d
        call    function_024
        call    function_019
        movlw   0x2e
        call    function_001
        goto    label_022

label_023:                                                  ; address: 0x012e

        call    function_000
        call    function_016
        decfsz  0x6d, F                                     ; reg: 0x06d
        goto    label_018

label_024:                                                  ; address: 0x0132

        bcf     0x66, 0x4                                   ; reg: 0x066
        goto    label_004

label_025:                                                  ; address: 0x0134

        incf    0x68, F                                     ; reg: 0x068
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x67, F                                     ; reg: 0x067
        movf    0x68, W                                     ; reg: 0x068
        call    function_002
        movlw   0x0f
        andwf   0x68, W                                     ; reg: 0x068
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_021
        call    function_000
        goto    label_019

function_000:                                               ; address: 0x013f

        call    function_018
        movlw   0x40
        movwf   FSR                                         ; reg: 0x004
        subwf   0x64, F                                     ; reg: 0x064

label_026:                                                  ; address: 0x0143

        movlw   0x20
        subwf   INDF, W                                     ; reg: 0x000
        movf    INDF, W                                     ; reg: 0x000
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        movlw   0x2e
        call    function_024
        incf    FSR, F                                      ; reg: 0x004
        movf    FSR, W                                      ; reg: 0x004
        call    function_002
        decfsz  0x64, F                                     ; reg: 0x064
        goto    label_026
        return

function_001:                                               ; address: 0x014f

        movwf   0x6c                                        ; reg: 0x06c
        movf    0x64, W                                     ; reg: 0x064
        incf    0x64, F                                     ; reg: 0x064
        movwf   FSR                                         ; reg: 0x004
        movf    0x6c, W                                     ; reg: 0x06c
        movwf   INDF                                        ; reg: 0x000
        return

function_002:                                               ; address: 0x0156

        andlw   0x0f
        xorlw   0x08
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    function_020
        return

label_027:                                                  ; address: 0x015b

        clrf    0x6b                                        ; reg: 0x06b

label_028:                                                  ; address: 0x015c

        call    function_013
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_030
        movlw   0x1e
        movwf   0x6c                                        ; reg: 0x06c

label_029:                                                  ; address: 0x0161

        movlw   0x3f
        addwf   0x6c, W                                     ; reg: 0x06c
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        incf    FSR, F                                      ; reg: 0x004
        incf    FSR, F                                      ; reg: 0x004
        movwf   INDF                                        ; reg: 0x000
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_029
        decf    FSR, F                                      ; reg: 0x004
        movlw   0x0f
        andwf   0x6f, W                                     ; reg: 0x06f
        movwf   INDF                                        ; reg: 0x000
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   0x40                                        ; reg: 0x040
        incf    0x6b, F                                     ; reg: 0x06b

label_030:                                                  ; address: 0x0171

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_028
        movf    0x6b, W                                     ; reg: 0x06b
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_031
        movlw   0x54
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_036

label_031:                                                  ; address: 0x017c

        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movf    0x6b, W                                     ; reg: 0x06b
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_033
        sublw   0x10
        movlw   0x10
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        movwf   0x6b                                        ; reg: 0x06b
        movlw   0x60
        movwf   FSR                                         ; reg: 0x004
        movf    0x6b, W                                     ; reg: 0x06b
        movwf   INDF                                        ; reg: 0x000
        call    function_027
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rlf     0x6b, F                                     ; reg: 0x06b
        movlw   0x40
        movwf   FSR                                         ; reg: 0x004

label_032:                                                  ; address: 0x0190

        call    function_027
        incf    FSR, F                                      ; reg: 0x004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_032
        goto    label_004

label_033:                                                  ; address: 0x0195

        movlw   0x60
        call    function_025
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_004
        sublw   0x10
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_004
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rlf     0x60, W                                     ; reg: 0x060
        addlw   0x3f
        movwf   FSR                                         ; reg: 0x004
        clrf    0x6b                                        ; reg: 0x06b
        btfsc   0x66, 0x3                                   ; reg: 0x066

label_034:                                                  ; address: 0x01a2

        call    function_020
        call    function_020
        call    function_026
        movwf   0x67                                        ; reg: 0x067
        call    function_023
        decf    FSR, F                                      ; reg: 0x004
        call    function_026
        movwf   0x68                                        ; reg: 0x068
        call    function_022
        decf    FSR, F                                      ; reg: 0x004
        btfss   0x66, 0x3                                   ; reg: 0x066
        goto    label_035
        movlw   0x3a
        call    function_024
        incf    0x6b, F                                     ; reg: 0x06b
        movlw   0x0f
        andwf   0x67, W                                     ; reg: 0x067
        call    function_011
        movf    0x68, W                                     ; reg: 0x068
        call    function_009
        call    function_007
        movf    0x20, W                                     ; reg: 0x020
        call    function_022
        call    function_021
        movf    0x6b, W                                     ; reg: 0x06b
        andlw   0x03
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_035
        decf    0x60, W                                     ; reg: 0x060
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_035
        call    function_016

label_035:                                                  ; address: 0x01c2

        decfsz  0x60, F                                     ; reg: 0x060
        goto    label_034
        goto    label_004

label_036:                                                  ; address: 0x01c5

        movlw   0xf8
        call    function_015
        btfsc   0x66, 0x7                                   ; reg: 0x066
        goto    label_037
        bsf     0x66, 0x7                                   ; reg: 0x066
        movlw   0x46
        call    function_024
        goto    label_038

label_037:                                                  ; address: 0x01cd

        bcf     0x66, 0x7                                   ; reg: 0x066
        movlw   0x4e

label_038:                                                  ; address: 0x01cf

        call    function_024
        movlw   0x66
        movwf   FSR                                         ; reg: 0x004
        call    function_027
        goto    label_004

label_039:                                                  ; address: 0x01d4

        clrf    0x6b                                        ; reg: 0x06b

label_040:                                                  ; address: 0x01d5

        call    function_013
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_042
        movlw   0x0f
        andwf   0x6f, F                                     ; reg: 0x06f
        movlw   0x10
        movwf   0x6c                                        ; reg: 0x06c

label_041:                                                  ; address: 0x01dc

        movlw   0x6d
        addwf   0x6c, W                                     ; reg: 0x06c
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        incf    FSR, F                                      ; reg: 0x004
        incf    FSR, F                                      ; reg: 0x004
        movwf   INDF                                        ; reg: 0x000
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_041
        incf    0x6b, F                                     ; reg: 0x06b
        movf    0x6b, W                                     ; reg: 0x06b
        sublw   0x08
        movlw   0x08
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        movwf   0x6b                                        ; reg: 0x06b

label_042:                                                  ; address: 0x01eb

        movlw   0x2e
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_040
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_043
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movf    0x6b, W                                     ; reg: 0x06b
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        call    function_003
        goto    label_004

label_043:                                                  ; address: 0x01fb

        movf    0x6b, W                                     ; reg: 0x06b
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_040
        call    function_016

label_044:                                                  ; address: 0x01ff

        call    function_003
        bsf     0x66, 0x1                                   ; reg: 0x066
        call    function_014
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_004
        movlw   0x0d
        call    function_024
        movf    0x6b, W                                     ; reg: 0x06b
        sublw   0x04
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_044
        movlw   0x1b
        call    function_024
        movlw   0x5b
        call    function_024
        movlw   0x41
        call    function_024
        goto    label_044

function_003:                                               ; address: 0x0213

        movf    0x6b, W                                     ; reg: 0x06b
        movwf   0x6d                                        ; reg: 0x06d
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rlf     0x6b, W                                     ; reg: 0x06b
        addlw   0x6f
        movwf   FSR                                         ; reg: 0x004
        clrf    0x60                                        ; reg: 0x060

label_045:                                                  ; address: 0x021a

        movlw   0x04
        xorwf   0x60, W                                     ; reg: 0x060
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        call    function_016
        movf    INDF, W                                     ; reg: 0x000
        decf    FSR, F                                      ; reg: 0x004
        andlw   0x0f
        movwf   0x20                                        ; reg: 0x020
        call    function_023
        call    function_012
        movf    INDF, W                                     ; reg: 0x000
        decf    FSR, F                                      ; reg: 0x004
        movwf   0x20                                        ; reg: 0x020
        call    function_022
        call    function_010
        call    function_007
        movlw   0x3a
        call    function_024
        movf    0x20, W                                     ; reg: 0x020
        call    function_022
        call    function_021
        call    function_019
        incf    0x60, F                                     ; reg: 0x060
        decfsz  0x6d, F                                     ; reg: 0x06d
        goto    label_045
        return

label_046:                                                  ; address: 0x0234

        clrf    0x6b                                        ; reg: 0x06b

label_047:                                                  ; address: 0x0235

        call    function_013
        btfsc   0x66, 0x0                                   ; reg: 0x066
        goto    label_048
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        goto    label_047

label_048:                                                  ; address: 0x023d

        movlw   0x0f
        andwf   0x6f, W                                     ; reg: 0x06f
        movwf   (Common_RAM + 1)                            ; reg: 0x071
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   Common_RAM                                  ; reg: 0x070
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movlw   0x08
        call    function_024

label_049:                                                  ; address: 0x0248

        movlw   0x3a
        call    function_024
        call    function_013
        movlw   0x2b
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_051
        call    function_004
        incf    Common_RAM, F                               ; reg: 0x070
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    (Common_RAM + 1), F                         ; reg: 0x071

label_050:                                                  ; address: 0x0253

        movlw   0x03
        andwf   0x6b, W                                     ; reg: 0x06b
        xorlw   0x03
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        call    function_016
        incf    0x6b, F                                     ; reg: 0x06b
        call    function_018
        movf    (Common_RAM + 1), W                         ; reg: 0x071
        call    function_023
        movf    Common_RAM, W                               ; reg: 0x070
        call    function_022
        goto    label_049

label_051:                                                  ; address: 0x025f

        movlw   0x2d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_052
        call    function_004
        movlw   0x01
        subwf   Common_RAM, F                               ; reg: 0x070
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        decf    (Common_RAM + 1), F                         ; reg: 0x071
        goto    label_050

label_052:                                                  ; address: 0x0269

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_053
        call    function_004
        goto    label_050

label_053:                                                  ; address: 0x026f

        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        call    function_004
        goto    label_004

function_004:                                               ; address: 0x0275

        btfss   0x66, 0x0                                   ; reg: 0x066
        return
        movf    (Common_RAM + 1), W                         ; reg: 0x071
        andlw   0x0f
        iorlw   0x40
        call    function_011
        movf    Common_RAM, W                               ; reg: 0x070
        call    function_009
        movf    0x6e, W                                     ; reg: 0x06e
        call    function_008
        return

label_054:                                                  ; address: 0x0280

        call    function_013
        btfsc   0x66, 0x0                                   ; reg: 0x066
        goto    label_055
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_054
        goto    label_109

label_055:                                                  ; address: 0x0288

        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movlw   0x01
        movwf   0x6d                                        ; reg: 0x06d
        clrf    (Common_RAM + 3)                            ; reg: 0x073
        clrf    (Common_RAM + 2)                            ; reg: 0x072
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   Common_RAM                                  ; reg: 0x070
        movlw   0x0f
        andwf   0x6f, W                                     ; reg: 0x06f
        movwf   (Common_RAM + 1)                            ; reg: 0x071
        bsf     0x66, 0x4                                   ; reg: 0x066
        goto    label_016

label_056:                                                  ; address: 0x0297

        bcf     0x66, 0x5                                   ; reg: 0x066
        clrf    0x60                                        ; reg: 0x060

label_057:                                                  ; address: 0x0299

        call    function_013
        btfsc   0x66, 0x0                                   ; reg: 0x066
        goto    label_058
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_057
        goto    label_109

label_058:                                                  ; address: 0x02a1

        movlw   0x0f
        andwf   0x6f, W                                     ; reg: 0x06f
        movwf   0x69                                        ; reg: 0x069
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   0x6a                                        ; reg: 0x06a
        btfsc   0x66, 0x5                                   ; reg: 0x066
        goto    label_059
        movlw   0x2e
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_059
        bsf     0x66, 0x5                                   ; reg: 0x066
        movlw   0x0f
        andwf   0x6f, W                                     ; reg: 0x06f
        movwf   0x67                                        ; reg: 0x067
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   0x68                                        ; reg: 0x068
        goto    label_057

label_059:                                                  ; address: 0x02b3

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109

label_060:                                                  ; address: 0x02b7

        call    function_013
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_062
        movlw   0x0f
        movwf   0x6c                                        ; reg: 0x06c

label_061:                                                  ; address: 0x02bc

        movlw   0x6f
        addwf   0x6c, W                                     ; reg: 0x06c
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        incf    FSR, F                                      ; reg: 0x004
        movwf   INDF                                        ; reg: 0x000
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_061
        movf    0x6e, W                                     ; reg: 0x06e
        movwf   Common_RAM                                  ; reg: 0x070
        incf    0x60, F                                     ; reg: 0x060

label_062:                                                  ; address: 0x02c7

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_060
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movf    0x60, W                                     ; reg: 0x060
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_004
        sublw   0x10
        movlw   0x10
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        movwf   0x60                                        ; reg: 0x060
        btfsc   0x66, 0x5                                   ; reg: 0x066
        goto    label_063
        movf    0x69, W                                     ; reg: 0x069
        movwf   0x67                                        ; reg: 0x067
        movf    0x6a, W                                     ; reg: 0x06a
        movwf   0x68                                        ; reg: 0x068
        decf    0x60, W                                     ; reg: 0x060
        addwf   0x6a, F                                     ; reg: 0x06a
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x69, F                                     ; reg: 0x069
        goto    label_064

label_063:                                                  ; address: 0x02e1

        movf    0x68, W                                     ; reg: 0x068
        subwf   0x6a, W                                     ; reg: 0x06a
        movf    0x67, W                                     ; reg: 0x067
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x67, W                                     ; reg: 0x067
        subwf   0x69, W                                     ; reg: 0x069
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_109

label_064:                                                  ; address: 0x02e9

        movf    0x60, W                                     ; reg: 0x060
        movwf   0x6b                                        ; reg: 0x06b
        addlw   0x6f
        movwf   FSR                                         ; reg: 0x004

label_065:                                                  ; address: 0x02ed

        movf    0x67, W                                     ; reg: 0x067
        andlw   0x0f
        iorlw   0x40
        call    function_011
        movf    0x68, W                                     ; reg: 0x068
        call    function_009
        movf    INDF, W                                     ; reg: 0x000
        call    function_008
        decf    FSR, F                                      ; reg: 0x004
        incf    0x68, F                                     ; reg: 0x068
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x67, F                                     ; reg: 0x067
        movf    0x68, W                                     ; reg: 0x068
        subwf   0x6a, W                                     ; reg: 0x06a
        movf    0x67, W                                     ; reg: 0x067
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x67, W                                     ; reg: 0x067
        subwf   0x69, W                                     ; reg: 0x069
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_065
        goto    label_064

label_066:                                                  ; address: 0x0304

        bsf     0x66, 0x1                                   ; reg: 0x066

label_067:                                                  ; address: 0x0305

        call    function_014
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_067
        bcf     0x65, 0x5                                   ; reg: 0x065
        movlw   0x57
        xorwf   0x65, W                                     ; reg: 0x065
        movlw   0x50
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_080
        movlw   0x53
        xorwf   0x65, W                                     ; reg: 0x065
        movlw   0x60
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_080
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109

label_068:                                                  ; address: 0x0319

        movlw   0xca
        call    function_015
        movf    0x62, W                                     ; reg: 0x062
        call    function_022
        call    function_018
        movlw   0xcf
        call    function_015
        movlw   0x10
        call    function_011
        call    function_007
        movf    0x20, W                                     ; reg: 0x020
        call    function_022
        movlw   0x20
        subwf   0x20, W                                     ; reg: 0x020
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_069
        call    function_020
        movlw   0x27
        call    function_024
        movf    0x20, W                                     ; reg: 0x020
        call    function_024
        movlw   0x27
        call    function_024

label_069:                                                  ; address: 0x0330

        call    function_021
        call    function_018
        movlw   0xd2
        call    function_015
        movlw   0x20
        call    function_011
        call    function_007
        call    function_021
        call    function_018
        clrf    0x69                                        ; reg: 0x069
        clrf    0x6a                                        ; reg: 0x06a
        movlw   0x1d
        movwf   0x6c                                        ; reg: 0x06c
        movlw   0x4c
        movwf   0x27                                        ; reg: 0x027
        clrf    0x28                                        ; reg: 0x028
        movlw   0x18
        movwf   0x6b                                        ; reg: 0x06b

label_070:                                                  ; address: 0x0342

        rlf     0x28, W                                     ; reg: 0x028
        rlf     0x27, F                                     ; reg: 0x027
        rlf     0x6c, F                                     ; reg: 0x06c
        rlf     0x6a, F                                     ; reg: 0x06a
        rlf     0x69, F                                     ; reg: 0x069
        rlf     0x28, F                                     ; reg: 0x028
        movf    0x2b, W                                     ; reg: 0x02b
        subwf   0x6a, F                                     ; reg: 0x06a
        movf    0x2a, W                                     ; reg: 0x02a
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incfsz  0x2a, W                                     ; reg: 0x02a
        subwf   0x69, F                                     ; reg: 0x069
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        bsf     0x28, 0x0                                   ; reg: 0x028
        btfsc   0x28, 0x0                                   ; reg: 0x028
        goto    label_071
        addwf   0x69, F                                     ; reg: 0x069
        movf    0x2b, W                                     ; reg: 0x02b
        addwf   0x6a, F                                     ; reg: 0x06a

label_071:                                                  ; address: 0x0355

        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_070
        movf    0x63, W                                     ; reg: 0x063
        movwf   0x6b                                        ; reg: 0x06b

label_072:                                                  ; address: 0x0359

        btfsc   0x6b, 0x0                                   ; reg: 0x06b
        goto    label_073
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x27, F                                     ; reg: 0x027
        rrf     0x28, F                                     ; reg: 0x028
        rrf     0x6b, F                                     ; reg: 0x06b
        goto    label_072

label_073:                                                  ; address: 0x0360

        movlw   0x10
        movwf   0x6b                                        ; reg: 0x06b
        clrf    0x6c                                        ; reg: 0x06c
        clrf    0x69                                        ; reg: 0x069
        clrf    0x6a                                        ; reg: 0x06a

label_074:                                                  ; address: 0x0365

        rlf     0x28, F                                     ; reg: 0x028
        rlf     0x27, F                                     ; reg: 0x027
        rlf     0x6a, F                                     ; reg: 0x06a
        rlf     0x69, F                                     ; reg: 0x069
        rlf     0x6c, F                                     ; reg: 0x06c
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_079
        movf    0x6c, W                                     ; reg: 0x06c
        andlw   0x0f
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_075
        swapf   0x69, W                                     ; reg: 0x069
        andlw   0x0f
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_076
        movf    0x69, W                                     ; reg: 0x069
        andlw   0x0f
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_077
        goto    label_078

label_075:                                                  ; address: 0x0379

        movf    0x6c, W                                     ; reg: 0x06c
        call    function_023

label_076:                                                  ; address: 0x037b

        swapf   0x69, W                                     ; reg: 0x069
        call    function_023

label_077:                                                  ; address: 0x037d

        movf    0x69, W                                     ; reg: 0x069
        call    function_023

label_078:                                                  ; address: 0x037f

        movf    0x6a, W                                     ; reg: 0x06a
        call    function_022
        call    function_020
        movlw   0x4b
        call    function_024
        movlw   0x48
        call    function_024
        movlw   0x7a
        call    function_024
        call    function_016
        bsf     0x66, 0x4                                   ; reg: 0x066
        btfss   0x66, 0x7                                   ; reg: 0x066
        goto    label_033
        goto    label_004

label_079:                                                  ; address: 0x038d

        movlw   0x6a
        call    function_005
        movlw   0x69
        call    function_005
        movlw   0x6c
        call    function_005
        goto    label_074

function_005:                                               ; address: 0x0394

        movwf   FSR                                         ; reg: 0x004
        movlw   0x03
        addwf   INDF, F                                     ; reg: 0x000
        btfss   INDF, 0x3                                   ; reg: 0x000
        subwf   INDF, F                                     ; reg: 0x000
        movlw   0x30
        addwf   INDF, F                                     ; reg: 0x000
        btfss   INDF, 0x7                                   ; reg: 0x000
        subwf   INDF, F                                     ; reg: 0x000
        return

label_080:                                                  ; address: 0x039e

        movwf   0x6b                                        ; reg: 0x06b
        movlw   0x3d
        call    function_024

label_081:                                                  ; address: 0x03a1

        call    function_013
        btfsc   0x66, 0x0                                   ; reg: 0x066
        goto    label_082
        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_081
        goto    label_109

label_082:                                                  ; address: 0x03a9

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_081
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movf    0x6b, W                                     ; reg: 0x06b
        call    function_011
        movf    0x6e, W                                     ; reg: 0x06e
        call    function_009
        goto    label_004

label_083:                                                  ; address: 0x03b6

        bcf     0x66, 0x1                                   ; reg: 0x066
        bcf     0x66, 0x0                                   ; reg: 0x066
        clrf    0x6e                                        ; reg: 0x06e
        clrf    0x6f                                        ; reg: 0x06f
        clrf    Common_RAM                                  ; reg: 0x070

label_084:                                                  ; address: 0x03bb

        call    function_014
        btfss   0x66, 0x3                                   ; reg: 0x066
        goto    label_086
        btfss   0x66, 0x2                                   ; reg: 0x066
        goto    label_086
        movwf   0x65                                        ; reg: 0x065
        swapf   0x65, F                                     ; reg: 0x065
        movlw   0x04
        movwf   0x6b                                        ; reg: 0x06b

label_085:                                                  ; address: 0x03c4

        rlf     0x65, F                                     ; reg: 0x065
        rlf     0x6e, F                                     ; reg: 0x06e
        rlf     0x6f, F                                     ; reg: 0x06f
        rlf     Common_RAM, F                               ; reg: 0x070
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_085
        bsf     0x66, 0x0                                   ; reg: 0x066
        goto    label_084

label_086:                                                  ; address: 0x03cc

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_084
        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movlw   0xd9
        btfsc   0x66, 0x3                                   ; reg: 0x066

label_087:                                                  ; address: 0x03d6

        movlw   0xe2
        call    function_015
        call    function_016
        bsf     PORTA, RA1                                  ; reg: 0x005, bit: 1
        btfss   0x66, 0x3                                   ; reg: 0x066
        goto    label_088
        bcf     PORTA, RA0                                  ; reg: 0x005, bit: 0
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_090
        movf    Common_RAM, W                               ; reg: 0x070
        iorlw   0xc0
        call    function_011
        movf    0x6f, W                                     ; reg: 0x06f
        call    function_009
        bcf     0x6e, 0x0                                   ; reg: 0x06e
        movf    0x6e, W                                     ; reg: 0x06e
        call    function_009
        goto    label_091

label_088:                                                  ; address: 0x03e8

        call    function_028
        call    function_007
        movf    0x20, W                                     ; reg: 0x020
        movwf   0x63                                        ; reg: 0x063
        bcf     PORTA, RA0                                  ; reg: 0x005, bit: 0
        incf    0x21, F                                     ; reg: 0x021

label_089:                                                  ; address: 0x03ee

        decfsz  0x22, F                                     ; reg: 0x022
        goto    label_089
        decfsz  0x21, F                                     ; reg: 0x021
        goto    label_089

label_090:                                                  ; address: 0x03f2

        movlw   0x80
        call    function_011

label_091:                                                  ; address: 0x03f4

        call    function_007
        btfsc   PIR1, RCIF                                  ; reg: 0x00c, bit: 5
        goto    label_092
        swapf   0x20, W                                     ; reg: 0x020
        andlw   0x0f
        addlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movf    INDF, W                                     ; reg: 0x000
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_090
        btfsc   INDF, 0x7                                   ; reg: 0x000
        goto    label_092
        movf    0x20, W                                     ; reg: 0x020
        call    function_022
        call    function_019
        goto    label_090

label_092:                                                  ; address: 0x0404

        bsf     0x66, 0x3                                   ; reg: 0x066
        bsf     PORTA, RA0                                  ; reg: 0x005, bit: 0
        bcf     PORTA, RA1                                  ; reg: 0x005, bit: 1
        movf    RCREG, W                                    ; reg: 0x01a
        call    function_016
        movf    0x20, W                                     ; reg: 0x020
        movwf   0x62                                        ; reg: 0x062
        goto    label_068

label_093:                                                  ; address: 0x040c

        movlw   0x05
        movwf   PCLATH                                      ; reg: 0x00a
        movlw   0xf3
        call    function_015
        movlw   0x06
        movwf   PCLATH                                      ; reg: 0x00a
        movlw   0x00
        call    function_015
        movlw   0x07
        movwf   PCLATH                                      ; reg: 0x00a
        movlw   0x01
        call    function_015
        call    function_016
        goto    label_004

label_094:                                                  ; address: 0x041a

        movlw   0x0f
        goto    label_097

label_095:                                                  ; address: 0x041c

        clrf    0x6b                                        ; reg: 0x06b
        goto    label_098

label_096:                                                  ; address: 0x041e

        movlw   0xff

label_097:                                                  ; address: 0x041f

        movwf   0x6b                                        ; reg: 0x06b

label_098:                                                  ; address: 0x0420

        bcf     0x66, 0x6                                   ; reg: 0x066

label_099:                                                  ; address: 0x0421

        call    function_013
        btfss   0x66, 0x0                                   ; reg: 0x066
        goto    label_100
        bsf     0x66, 0x6                                   ; reg: 0x066
        movf    0x6e, W                                     ; reg: 0x06e
        andlw   0x0f
        addlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movf    0x6b, W                                     ; reg: 0x06b
        movwf   INDF                                        ; reg: 0x000

label_100:                                                  ; address: 0x042b

        movlw   0x20
        xorwf   0x65, W                                     ; reg: 0x065
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_099
        btfss   0x66, 0x6                                   ; reg: 0x066
        goto    label_103

label_101:                                                  ; address: 0x0431

        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_108
        movlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movlw   0x10
        movwf   0x6b                                        ; reg: 0x06b

label_102:                                                  ; address: 0x0439

        call    function_027
        incf    FSR, F                                      ; reg: 0x004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_102
        goto    label_004

label_103:                                                  ; address: 0x043e

        bsf     0x66, 0x1                                   ; reg: 0x066
        movlw   0x4e
        bcf     0x65, 0x5                                   ; reg: 0x065
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_105
        movlw   0x10
        movwf   0x6c                                        ; reg: 0x06c
        movlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movf    0x6b, W                                     ; reg: 0x06b

label_104:                                                  ; address: 0x0449

        movwf   INDF                                        ; reg: 0x000
        incf    FSR, F                                      ; reg: 0x004
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_104
        call    function_014
        goto    label_101

label_105:                                                  ; address: 0x044f

        movlw   0x0d
        xorwf   0x65, W                                     ; reg: 0x065
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_109
        movlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movlw   0x10
        movwf   0x6b                                        ; reg: 0x06b
        call    function_017

label_106:                                                  ; address: 0x0458

        call    function_019
        movf    FSR, W                                      ; reg: 0x004
        call    function_023
        movf    INDF, W                                     ; reg: 0x000
        movlw   0x58
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    label_107
        movlw   0x54
        btfsc   INDF, 0x7                                   ; reg: 0x000
        movlw   0x76

label_107:                                                  ; address: 0x0462

        call    function_024
        incf    FSR, F                                      ; reg: 0x004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_106
        goto    label_004

label_108:                                                  ; address: 0x0467

        call    function_006

label_109:                                                  ; address: 0x0468

        movlw   0xeb
        call    function_015
        goto    label_004

function_006:                                               ; address: 0x046b

        movlw   0x30
        movwf   FSR                                         ; reg: 0x004
        movlw   0x10
        movwf   0x6b                                        ; reg: 0x06b

label_110:                                                  ; address: 0x046f

        call    function_026
        incf    FSR, F                                      ; reg: 0x004
        decfsz  0x6b, F                                     ; reg: 0x06b
        goto    label_110
        return

function_007:                                               ; address: 0x0474

        clrf    0x26                                        ; reg: 0x026
        movlw   0x80
        movwf   0x25                                        ; reg: 0x025
        movlw   0x08
        movwf   0x29                                        ; reg: 0x029
        clrf    0x23                                        ; reg: 0x023
        clrf    0x24                                        ; reg: 0x024
        clrf    0x27                                        ; reg: 0x027
        clrf    0x28                                        ; reg: 0x028

label_111:                                                  ; address: 0x047d

        btfsc   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_111

label_112:                                                  ; address: 0x047f

        incfsz  0x26, F                                     ; reg: 0x026
        goto    label_113
        incfsz  0x25, F                                     ; reg: 0x025

label_113:                                                  ; address: 0x0482

        goto    label_114
        goto    label_131

label_114:                                                  ; address: 0x0484

        btfss   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_112

label_115:                                                  ; address: 0x0486

        incfsz  0x24, F                                     ; reg: 0x024
        goto    label_116
        incfsz  0x23, F                                     ; reg: 0x023

label_116:                                                  ; address: 0x0489

        goto    label_117
        goto    function_007

label_117:                                                  ; address: 0x048b

        btfsc   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_115

label_118:                                                  ; address: 0x048d

        incfsz  0x28, F                                     ; reg: 0x028
        goto    label_119
        incfsz  0x27, F                                     ; reg: 0x027

label_119:                                                  ; address: 0x0490

        goto    label_120
        goto    label_131

label_120:                                                  ; address: 0x0492

        btfss   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_118
        bcf     0x25, 0x7                                   ; reg: 0x025
        movf    0x26, W                                     ; reg: 0x026
        subwf   0x28, F                                     ; reg: 0x028
        movf    0x25, W                                     ; reg: 0x025
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x25, W                                     ; reg: 0x025
        subwf   0x27, F                                     ; reg: 0x027
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_121
        comf    0x27, F                                     ; reg: 0x027
        comf    0x28, F                                     ; reg: 0x028
        incf    0x28, F                                     ; reg: 0x028
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027

label_121:                                                  ; address: 0x04a2

        movf    0x27, W                                     ; reg: 0x027
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    function_007
        movf    0x28, W                                     ; reg: 0x028
        sublw   0x01
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    function_007
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x23, W                                     ; reg: 0x023
        movwf   0x27                                        ; reg: 0x027
        rrf     0x24, W                                     ; reg: 0x024
        movwf   0x28                                        ; reg: 0x028
        movf    0x26, W                                     ; reg: 0x026
        subwf   0x28, F                                     ; reg: 0x028
        movf    0x25, W                                     ; reg: 0x025
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x25, W                                     ; reg: 0x025
        subwf   0x27, F                                     ; reg: 0x027
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_122
        comf    0x27, F                                     ; reg: 0x027
        comf    0x28, F                                     ; reg: 0x028
        incf    0x28, F                                     ; reg: 0x028
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027

label_122:                                                  ; address: 0x04bb

        movf    0x27, W                                     ; reg: 0x027
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    function_007
        movf    0x28, W                                     ; reg: 0x028
        sublw   0x01
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    function_007

label_123:                                                  ; address: 0x04c2

        movlw   0x06
        movwf   0x22                                        ; reg: 0x022
        clrf    0x21                                        ; reg: 0x021
        clrf    0x27                                        ; reg: 0x027
        clrf    0x28                                        ; reg: 0x028

label_124:                                                  ; address: 0x04c7

        incfsz  0x22, F                                     ; reg: 0x022
        goto    label_125
        incfsz  0x21, F                                     ; reg: 0x021

label_125:                                                  ; address: 0x04ca

        goto    label_126
        goto    function_007

label_126:                                                  ; address: 0x04cc

        btfsc   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_124

label_127:                                                  ; address: 0x04ce

        incfsz  0x28, F                                     ; reg: 0x028
        goto    label_128
        incfsz  0x27, F                                     ; reg: 0x027

label_128:                                                  ; address: 0x04d1

        goto    label_129
        goto    label_131

label_129:                                                  ; address: 0x04d3

        btfss   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_127
        movf    0x26, W                                     ; reg: 0x026
        subwf   0x28, F                                     ; reg: 0x028
        movf    0x25, W                                     ; reg: 0x025
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x25, W                                     ; reg: 0x025
        subwf   0x27, F                                     ; reg: 0x027
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_130
        comf    0x27, F                                     ; reg: 0x027
        comf    0x28, F                                     ; reg: 0x028
        incf    0x28, F                                     ; reg: 0x028
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027

label_130:                                                  ; address: 0x04e2

        movf    0x27, W                                     ; reg: 0x027
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        goto    function_007
        movf    0x28, W                                     ; reg: 0x028
        sublw   0x01
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    function_007
        movf    0x26, W                                     ; reg: 0x026
        subwf   0x22, W                                     ; reg: 0x022
        movf    0x25, W                                     ; reg: 0x025
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x25, W                                     ; reg: 0x025
        subwf   0x21, W                                     ; reg: 0x021
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    function_007
        movf    0x24, W                                     ; reg: 0x024
        subwf   0x22, W                                     ; reg: 0x022
        movf    0x23, W                                     ; reg: 0x023
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x23, W                                     ; reg: 0x023
        subwf   0x21, W                                     ; reg: 0x021
        rrf     0x20, F                                     ; reg: 0x020
        decfsz  0x29, F                                     ; reg: 0x029
        goto    label_123
        movf    0x24, W                                     ; reg: 0x024
        addwf   0x26, W                                     ; reg: 0x026
        movwf   0x2b                                        ; reg: 0x02b
        movf    0x23, W                                     ; reg: 0x023
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        incf    0x23, W                                     ; reg: 0x023
        addwf   0x25, W                                     ; reg: 0x025
        movwf   0x2a                                        ; reg: 0x02a
        return

label_131:                                                  ; address: 0x0503

        btfss   PORTB, RB7                                  ; reg: 0x006, bit: 7
        goto    label_131
        goto    function_007

function_008:                                               ; address: 0x0506

        movwf   0x20                                        ; reg: 0x020
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x25, W                                     ; reg: 0x025
        movwf   0x27                                        ; reg: 0x027
        rrf     0x26, W                                     ; reg: 0x026
        movwf   0x28                                        ; reg: 0x028
        goto    label_132

function_009:                                               ; address: 0x050d

        movwf   0x20                                        ; reg: 0x020

function_010:                                               ; address: 0x050e

        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x25, W                                     ; reg: 0x025
        movwf   0x27                                        ; reg: 0x027
        rrf     0x26, W                                     ; reg: 0x026
        movwf   0x28                                        ; reg: 0x028
        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x27, F                                     ; reg: 0x027
        rrf     0x28, F                                     ; reg: 0x028

label_132:                                                  ; address: 0x0516

        bcf     STATUS, C                                   ; reg: 0x003, bit: 0
        rrf     0x27, F                                     ; reg: 0x027
        rrf     0x28, F                                     ; reg: 0x028
        movf    0x28, F                                     ; reg: 0x028
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027

label_133:                                                  ; address: 0x051c

        goto    label_134

label_134:                                                  ; address: 0x051d

        nop
        goto    label_135

label_135:                                                  ; address: 0x051f

        decfsz  0x28, F                                     ; reg: 0x028
        goto    label_133
        decfsz  0x27, F                                     ; reg: 0x027
        goto    label_134
        goto    function_012

function_011:                                               ; address: 0x0524

        movwf   0x20                                        ; reg: 0x020

function_012:                                               ; address: 0x0525

        movlw   0x09
        movwf   0x29                                        ; reg: 0x029
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        bcf     PORTB, RB7                                  ; reg: 0x006, bit: 7
        clrf    STATUS                                      ; reg: 0x003

label_136:                                                  ; address: 0x052a

        movf    0x25, W                                     ; reg: 0x025
        movwf   0x27                                        ; reg: 0x027
        movf    0x26, W                                     ; reg: 0x026
        movwf   0x28                                        ; reg: 0x028
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027
        bcf     PORTB, RB7                                  ; reg: 0x006, bit: 7

label_137:                                                  ; address: 0x0531

        goto    label_138

label_138:                                                  ; address: 0x0532

        nop
        goto    label_139

label_139:                                                  ; address: 0x0534

        decfsz  0x28, F                                     ; reg: 0x028
        goto    label_137
        decfsz  0x27, F                                     ; reg: 0x027
        goto    label_138
        decfsz  0x29, F                                     ; reg: 0x029
        goto    label_140
        bsf     PORTB, RB7                                  ; reg: 0x006, bit: 7
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        bsf     PORTB, RB7                                  ; reg: 0x006, bit: 7
        clrf    STATUS                                      ; reg: 0x003
        return

label_140:                                                  ; address: 0x053f

        bsf     PORTB, RB7                                  ; reg: 0x006, bit: 7
        rrf     0x20, F                                     ; reg: 0x020
        movf    0x25, W                                     ; reg: 0x025
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        movf    0x2a, W                                     ; reg: 0x02a
        movwf   0x27                                        ; reg: 0x027
        movf    0x26, W                                     ; reg: 0x026
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        movf    0x2b, W                                     ; reg: 0x02b
        movwf   0x28                                        ; reg: 0x028
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        incf    0x27, F                                     ; reg: 0x027

label_141:                                                  ; address: 0x054b

        goto    label_142

label_142:                                                  ; address: 0x054c

        nop
        goto    label_143

label_143:                                                  ; address: 0x054e

        decfsz  0x28, F                                     ; reg: 0x028
        goto    label_141
        decfsz  0x27, F                                     ; reg: 0x027
        goto    label_142
        goto    label_136

function_013:                                               ; address: 0x0553

        bcf     0x66, 0x1                                   ; reg: 0x066
        bcf     0x66, 0x0                                   ; reg: 0x066
        clrf    0x6f                                        ; reg: 0x06f
        clrf    0x6e                                        ; reg: 0x06e

label_144:                                                  ; address: 0x0557

        call    function_014
        btfss   0x66, 0x2                                   ; reg: 0x066
        return
        movwf   0x65                                        ; reg: 0x065
        movlw   0x0f
        andwf   0x6f, F                                     ; reg: 0x06f
        swapf   0x6f, F                                     ; reg: 0x06f
        swapf   0x6e, F                                     ; reg: 0x06e
        andwf   0x6e, W                                     ; reg: 0x06e
        iorwf   0x6f, F                                     ; reg: 0x06f
        movlw   0xf0
        andwf   0x6e, F                                     ; reg: 0x06e
        movf    0x65, W                                     ; reg: 0x065
        iorwf   0x6e, F                                     ; reg: 0x06e
        bsf     0x66, 0x0                                   ; reg: 0x066
        goto    label_144

function_014:                                               ; address: 0x0567

        btfss   RCSTA, OERR                                 ; reg: 0x018, bit: 1
        goto    label_145
        bcf     RCSTA, CREN                                 ; reg: 0x018, bit: 4
        bsf     RCSTA, CREN                                 ; reg: 0x018, bit: 4
        movf    RCREG, W                                    ; reg: 0x01a

label_145:                                                  ; address: 0x056c

        btfss   PIR1, RCIF                                  ; reg: 0x00c, bit: 5
        goto    label_145
        movf    RCREG, W                                    ; reg: 0x01a
        movwf   0x65                                        ; reg: 0x065
        bcf     0x65, 0x7                                   ; reg: 0x065
        xorlw   0x1b
        movlw   0x20
        btfss   STATUS, Z                                   ; reg: 0x003, bit: 2
        movf    0x65, W                                     ; reg: 0x065
        call    function_024
        xorlw   0x0d
        movlw   0x0a
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        call    function_024
        movf    0x65, W                                     ; reg: 0x065
        btfsc   0x66, 0x1                                   ; reg: 0x066
        return
        btfss   0x65, 0x6                                   ; reg: 0x065
        goto    label_147
        andlw   0xdf
        addlw   0xb9
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_148
        addlw   0x06
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_148
        addlw   0x0a

label_146:                                                  ; address: 0x0587

        bsf     0x66, 0x2                                   ; reg: 0x066
        return

label_147:                                                  ; address: 0x0589

        addlw   0xc6
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_148
        addlw   0x0a
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        goto    label_146

label_148:                                                  ; address: 0x058f

        bcf     0x66, 0x2                                   ; reg: 0x066
        return

function_015:                                               ; address: 0x0591

        addlw   0xff
        movwf   0x6c                                        ; reg: 0x06c

label_149:                                                  ; address: 0x0593

        movf    0x6c, W                                     ; reg: 0x06c
        call    function_029
        xorlw   0x04
        btfsc   STATUS, Z                                   ; reg: 0x003, bit: 2
        return
        xorlw   0x04
        call    function_024
        incf    0x6c, F                                     ; reg: 0x06c
        goto    label_149

function_016:                                               ; address: 0x059c

        movlw   0x0d
        call    function_024
        movlw   0x0a
        goto    function_024

function_017:                                               ; address: 0x05a0

        call    function_020

function_018:                                               ; address: 0x05a1

        call    function_020
        call    function_020

function_019:                                               ; address: 0x05a3

        call    function_020

function_020:                                               ; address: 0x05a4

        movlw   0x20
        goto    function_024

function_021:                                               ; address: 0x05a6

        call    function_020
        movlw   0x2d
        call    function_024
        movlw   0x08
        movwf   0x6c                                        ; reg: 0x06c

label_150:                                                  ; address: 0x05ab

        rlf     0x20, F                                     ; reg: 0x020
        movlw   0x31
        btfss   STATUS, C                                   ; reg: 0x003, bit: 0
        movlw   0x30
        call    function_024
        decfsz  0x6c, F                                     ; reg: 0x06c
        goto    label_150
        return

function_022:                                               ; address: 0x05b3

        movwf   0x6c                                        ; reg: 0x06c
        swapf   0x6c, W                                     ; reg: 0x06c
        call    function_023
        movf    0x6c, W                                     ; reg: 0x06c

function_023:                                               ; address: 0x05b7

        andlw   0x0f
        addlw   0xf6
        btfsc   STATUS, C                                   ; reg: 0x003, bit: 0
        addlw   0x07
        addlw   0x3a

function_024:                                               ; address: 0x05bc

        btfss   PIR1, TXIF                                  ; reg: 0x00c, bit: 4
        goto    function_024
        movwf   TXREG                                       ; reg: 0x019
        return

function_025:                                               ; address: 0x05c0

        movwf   FSR                                         ; reg: 0x004

function_026:                                               ; address: 0x05c1

        movf    FSR, W                                      ; reg: 0x004
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movwf   CCPR2L                                      ; reg: 0x01b
        bsf     CCPR2H, 0x0                                 ; reg: 0x01c
        movf    RCREG, W                                    ; reg: 0x01a
        bcf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movwf   INDF                                        ; reg: 0x000
        return

function_027:                                               ; address: 0x05c9

        movf    INDF, W                                     ; reg: 0x000
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movwf   RCREG                                       ; reg: 0x01a
        movf    FSR, W                                      ; reg: 0x004
        movwf   CCPR2L                                      ; reg: 0x01b
        movlw   0x55
        movwf   CCP2CON                                     ; reg: 0x01d
        movlw   0xaa
        movwf   CCP2CON                                     ; reg: 0x01d
        bsf     CCPR2H, 0x1                                 ; reg: 0x01c

label_151:                                                  ; address: 0x05d3

        btfsc   CCPR2H, 0x1                                 ; reg: 0x01c
        goto    label_151
        bcf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        return

function_028:                                               ; address: 0x05d7

        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movlw   0x3b
        movwf   PORTB                                       ; reg: 0x006
        movlw   0x7f
        movwf   TMR0                                        ; reg: 0x001
        clrf    STATUS                                      ; reg: 0x003
        movlw   0x3f
        movwf   PORTB                                       ; reg: 0x006
        movlw   0x07
        movwf   0x27                                        ; reg: 0x027
        clrf    0x28                                        ; reg: 0x028

label_152:                                                  ; address: 0x05e2

        decfsz  0x28, F                                     ; reg: 0x028
        goto    label_152
        decfsz  0x27, F                                     ; reg: 0x027
        goto    label_152
        movlw   0xff
        movwf   PORTB                                       ; reg: 0x006
        bsf     STATUS, RP0                                 ; reg: 0x003, bit: 5
        movlw   0xfb
        movwf   PORTB                                       ; reg: 0x006
        clrf    STATUS                                      ; reg: 0x003
        return

        ; code

        org     0x05f3

        retlw   0x0d
        retlw   0x0a
        retlw   0x0a
        retlw   0x47
        retlw   0x20
        retlw   0x7b
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x04
        retlw   0x7d
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x09
        retlw   0x53
        retlw   0x43
        retlw   0x41
        retlw   0x4e
        retlw   0x20
        retlw   0x42
        retlw   0x52
        retlw   0x4b
        retlw   0x20
        retlw   0x7b
        retlw   0x50
        retlw   0x43
        retlw   0x3d
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x31
        retlw   0x38
        retlw   0x46
        retlw   0x7d
        retlw   0x0d
        retlw   0x0a
        retlw   0x53
        retlw   0x5b
        retlw   0x54
        retlw   0x5d
        retlw   0x7b
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x7d
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x44
        retlw   0x49
        retlw   0x53
        retlw   0x50
        retlw   0x4c
        retlw   0x41
        retlw   0x59
        retlw   0x7b
        retlw   0x53
        retlw   0x45
        retlw   0x54
        retlw   0x7d
        retlw   0x20
        retlw   0x31
        retlw   0x36
        retlw   0x78
        retlw   0x41
        retlw   0x44
        retlw   0x52
        retlw   0x20
        retlw   0x5b
        retlw   0x53
        retlw   0x54
        retlw   0x2d
        retlw   0x41
        retlw   0x55
        retlw   0x54
        retlw   0x4f
        retlw   0x20
        retlw   0x4f
        retlw   0x4e
        retlw   0x2f
        retlw   0x4f
        retlw   0x46
        retlw   0x46
        retlw   0x5d
        retlw   0x0d
        retlw   0x0a
        retlw   0x56
        retlw   0x2f
        retlw   0x58
        retlw   0x2f
        retlw   0x54
        retlw   0x5b
        retlw   0x4e
        retlw   0x5d
        retlw   0x20
        retlw   0x6e
        retlw   0x20
        retlw   0x6e
        retlw   0x20
        retlw   0x20
        retlw   0x6e
        retlw   0x20
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x53
        retlw   0x45
        retlw   0x54
        retlw   0x2f
        retlw   0x52
        retlw   0x53
        retlw   0x54
        retlw   0x2f
        retlw   0x54
        retlw   0x52
        retlw   0x41
        retlw   0x43
        retlw   0x45
        retlw   0x20
        retlw   0x42
        retlw   0x52
        retlw   0x4b
        retlw   0x20
        retlw   0x2d
        retlw   0x5b
        retlw   0x4e
        retlw   0x3a
        retlw   0x41
        retlw   0x4c
        retlw   0x4c
        retlw   0x5d
        retlw   0x0d
        retlw   0x0a
        retlw   0x52
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x2e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x2e
        retlw   0x2e
        retlw   0x2e
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x28
        retlw   0x53
        retlw   0x50
        retlw   0x2f
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x52
        retlw   0x45
        retlw   0x41
        retlw   0x44
        retlw   0x20
        retlw   0x38
        retlw   0x78
        retlw   0x41
        retlw   0x44
        retlw   0x52
        retlw   0x0d
        retlw   0x0a
        retlw   0x57
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x28
        retlw   0x2b
        retlw   0x2f
        retlw   0x2d
        retlw   0x2f
        retlw   0x53
        retlw   0x50
        retlw   0x2f
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x57
        retlw   0x52
        retlw   0x49
        retlw   0x54
        retlw   0x45
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x2d
        retlw   0x3e
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x0d
        retlw   0x0a
        retlw   0x44
        retlw   0x20
        retlw   0x73
        retlw   0x73
        retlw   0x73
        retlw   0x2e
        retlw   0x66
        retlw   0x66
        retlw   0x66
        retlw   0x20
        retlw   0x2e
        retlw   0x2e
        retlw   0x73
        retlw   0x73
        retlw   0x73
        retlw   0x2e
        retlw   0x66
        retlw   0x66
        retlw   0x66
        retlw   0x20
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x44
        retlw   0x49
        retlw   0x53
        retlw   0x50
        retlw   0x4c
        retlw   0x41
        retlw   0x59
        retlw   0x20
        retlw   0x04

function_029:                                               ; address: 0x0700

        addwf   PCL, F                                      ; reg: 0x002
        retlw   0x44
        retlw   0x41
        retlw   0x54
        retlw   0x41
        retlw   0x20
        retlw   0x34
        retlw   0x78
        retlw   0x20
        retlw   0x73
        retlw   0x73
        retlw   0x73
        retlw   0x2e
        retlw   0x66
        retlw   0x66
        retlw   0x66
        retlw   0x0d
        retlw   0x0a
        retlw   0x45
        retlw   0x20
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x09
        retlw   0x44
        retlw   0x49
        retlw   0x53
        retlw   0x50
        retlw   0x4c
        retlw   0x41
        retlw   0x59
        retlw   0x20
        retlw   0x45
        retlw   0x45
        retlw   0x44
        retlw   0x41
        retlw   0x54
        retlw   0x41
        retlw   0x20
        retlw   0x30
        retlw   0x30
        retlw   0x30
        retlw   0x2d
        retlw   0x6e
        retlw   0x6e
        retlw   0x6e
        retlw   0x0d
        retlw   0x0a
        retlw   0x46
        retlw   0x20
        retlw   0x73
        retlw   0x73
        retlw   0x73
        retlw   0x7b
        retlw   0x2e
        retlw   0x66
        retlw   0x66
        retlw   0x66
        retlw   0x7d
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x57
        retlw   0x52
        retlw   0x49
        retlw   0x54
        retlw   0x45
        retlw   0x20
        retlw   0x31
        retlw   0x36
        retlw   0x78
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x2d
        retlw   0x3e
        retlw   0x20
        retlw   0x73
        retlw   0x73
        retlw   0x73
        retlw   0x7b
        retlw   0x2e
        retlw   0x66
        retlw   0x66
        retlw   0x66
        retlw   0x7d
        retlw   0x0d
        retlw   0x0a
        retlw   0x42
        retlw   0x20
        retlw   0x7b
        retlw   0x57
        retlw   0x2f
        retlw   0x53
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x7d
        retlw   0x28
        retlw   0x43
        retlw   0x52
        retlw   0x29
        retlw   0x09
        retlw   0x09
        retlw   0x09
        retlw   0x44
        retlw   0x49
        retlw   0x53
        retlw   0x50
        retlw   0x4c
        retlw   0x41
        retlw   0x59
        retlw   0x20
        retlw   0x42
        retlw   0x52
        retlw   0x4b
        retlw   0x6e
        retlw   0x6e
        retlw   0x20
        retlw   0x57
        retlw   0x20
        retlw   0x53
        retlw   0x54
        retlw   0x41
        retlw   0x54
        retlw   0x55
        retlw   0x53
        retlw   0x20
        retlw   0x7b
        retlw   0x57
        retlw   0x52
        retlw   0x49
        retlw   0x54
        retlw   0x45
        retlw   0x20
        retlw   0x64
        retlw   0x64
        retlw   0x20
        retlw   0x2d
        retlw   0x3e
        retlw   0x20
        retlw   0x57
        retlw   0x2f
        retlw   0x53
        retlw   0x7d
        retlw   0x04
        retlw   0x0d
        retlw   0x0a
        retlw   0x09
        retlw   0x09
        retlw   0x49
        retlw   0x4e
        retlw   0x53
        retlw   0x49
        retlw   0x44
        retlw   0x45
        retlw   0x52
        retlw   0x20
        retlw   0x56
        retlw   0x31
        retlw   0x2e
        retlw   0x30
        retlw   0x09
        retlw   0x28
        retlw   0x48
        retlw   0x29
        retlw   0x2d
        retlw   0x3e
        retlw   0x20
        retlw   0x48
        retlw   0x45
        retlw   0x4c
        retlw   0x50
        retlw   0x0a
        retlw   0x04
        retlw   0x0d
        retlw   0x0a
        retlw   0x49
        retlw   0x4e
        retlw   0x53
        retlw   0x3e
        retlw   0x04
        retlw   0x42
        retlw   0x52
        retlw   0x4b
        retlw   0x3a
        retlw   0x04
        retlw   0x57
        retlw   0x3a
        retlw   0x04
        retlw   0x53
        retlw   0x54
        retlw   0x41
        retlw   0x54
        retlw   0x55
        retlw   0x53
        retlw   0x04
        retlw   0x09
        retlw   0x4f
        retlw   0x4e
        retlw   0x2d
        retlw   0x53
        retlw   0x43
        retlw   0x41
        retlw   0x4e
        retlw   0x04
        retlw   0x09
        retlw   0x42
        retlw   0x52
        retlw   0x4b
        retlw   0x2d
        retlw   0x52
        retlw   0x45
        retlw   0x54
        retlw   0x04
        retlw   0x0d
        retlw   0x0a
        retlw   0x09
        retlw   0x43
        retlw   0x4d
        retlw   0x44
        retlw   0x2d
        retlw   0x45
        retlw   0x52
        retlw   0x52
        retlw   0x4f
        retlw   0x52
        retlw   0x04
        retlw   0x09
        retlw   0x41
        retlw   0x55
        retlw   0x54
        retlw   0x4f
        retlw   0x2d
        retlw   0x4f
        retlw   0x04

;===============================================================================
; CONFIG Bits area

        ; config

        org     0x2007

        dw      0x0322

        end
