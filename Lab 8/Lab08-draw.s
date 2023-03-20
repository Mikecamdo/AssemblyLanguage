    .syntax     unified
	.cpu        cortex-m4
    .equ DISPLAY,             0xD0000000

	.text
	.global		rect
    .thumb_func
    .align
rect:
// Complete this function with your assembly code from Lab #7 and new modifications

    LDR R4, =DISPLAY
    LDR R5, =#100 //rows

    loop1: //row loop
        LDR R6, =#50 //columns

        loop2: //column loop
            LDR R8, =#240
            MUL R9, R5, R8
            ADD R9, R6
            BL random
            ORR R0, #0xFF000000
            STR R0, [R4, R9, LSL #2]
            ADD R6, #1
            CMP R6, #200
            BLO loop2
            
        ADD R5, #1
        CMP R5, #250
        BLO loop1

	.end
