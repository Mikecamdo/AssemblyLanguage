        .syntax unified
        .cpu cortex-m4

        .equ COLOR_BLUE, 0xFF0000FF
        .equ COLOR_GREEN, 0xFF00FF00
        .equ COLOR_RED, 0xFFFF0000
        .equ COLOR_CYAN, 0xFF00FFFF
        .equ COLOR_MAGENTA, 0xFFFF00FF
        .equ COLOR_YELLOW, 0xFFFFFF00
        .equ COLOR_LIGHTBLUE, 0xFF8080FF
        .equ COLOR_LIGHTGREEN, 0xFF80FF80
        .equ COLOR_LIGHTRED, 0xFFFF8080
        .equ COLOR_LIGHTCYAN, 0xFF80FFFF
        .equ COLOR_LIGHTMAGENTA, 0xFFFF80FF
        .equ COLOR_LIGHTYELLOW, 0xFFFFFF80
        .equ COLOR_DARKBLUE, 0xFF000080
        .equ COLOR_DARKGREEN, 0xFF008000
        .equ COLOR_DARKRED, 0xFF800000
        .equ COLOR_DARKCYAN, 0xFF008080
        .equ COLOR_DARKMAGENTA, 0xFF800080
        .equ COLOR_DARKYELLOW, 0xFF808000
        .equ COLOR_WHITE, 0xFFFFFFFF
        .equ COLOR_LIGHTGRAY, 0xFFD3D3D3
        .equ COLOR_GRAY, 0xFF808080
        .equ COLOR_DARKGRAY, 0xFF404040
        .equ COLOR_BLACK, 0xFF000000
        .equ COLOR_BROWN, 0xFFA52A2A
        .equ COLOR_ORANGE, 0xFFFFA500
        .equ DISPLAY, 0xD0000000

        .text
        .global rect
        .thumb_func
        .align
rect:
// Your assembly code goes here

    //R0 = color
    LDR R1, =#150 //rows
    LDR R3, =DISPLAY

    PUSH {R4-R5}

    loop1: //row loop
        LDR R2, =#50 //columns

        loop2: //column loop
            LDR R4, =#240
            MUL R5, R1, R4
            ADD R5, R2
            STR R0, [R3, R5, LSL #2]
            ADD R2, #1
            CMP R2, #150
            BLO loop2

        ADD R1, #1
        CMP R1, #250
        BLO loop1
        
    POP {R4-R5}
    bx lr
    .end