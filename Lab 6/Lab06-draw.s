    .syntax     unified
	.cpu        cortex-m4
    .equ COLOR_BLUE,          0xFF0000FF
    .equ COLOR_GREEN,         0xFF00FF00
    .equ COLOR_RED,           0xFFFF0000
    .equ COLOR_CYAN,          0xFF00FFFF
    .equ COLOR_MAGENTA,       0xFFFF00FF
    .equ COLOR_YELLOW,        0xFFFFFF00
    .equ COLOR_LIGHTBLUE,     0xFF8080FF
    .equ COLOR_LIGHTGREEN,    0xFF80FF80
    .equ COLOR_LIGHTRED,      0xFFFF8080
    .equ COLOR_LIGHTCYAN,     0xFF80FFFF
    .equ COLOR_LIGHTMAGENTA,  0xFFFF80FF
    .equ COLOR_LIGHTYELLOW,   0xFFFFFF80
    .equ COLOR_DARKBLUE,      0xFF000080
    .equ COLOR_DARKGREEN,     0xFF008000
    .equ COLOR_DARKRED,       0xFF800000
    .equ COLOR_DARKCYAN,      0xFF008080
    .equ COLOR_DARKMAGENTA,   0xFF800080
    .equ COLOR_DARKYELLOW,    0xFF808000
    .equ COLOR_WHITE,         0xFFFFFFFF
    .equ COLOR_LIGHTGRAY,     0xFFD3D3D3
    .equ COLOR_GRAY,          0xFF808080
    .equ COLOR_DARKGRAY,      0xFF404040
    .equ COLOR_BLACK,         0xFF000000
    .equ COLOR_BROWN,         0xFFA52A2A
    .equ COLOR_ORANGE,        0xFFFFA500
    .equ DISPLAY,             0xD0000000

    .text
	.global		line
    .thumb_func
    .align
line:
// Your assembly code goes here
    LDR R0, =#10
    LDR R1, =DISPLAY
    LDR R2, =#24010
    LDR R3, =COLOR_DARKGRAY

    loopi:
        STR R3, [R1, R2, LSL #2]
        LDR R2, =#24000
        ADD R0, #1
        ADD R2, R0
        CMP R0, #230
        BLO loopi

    LDR R0, =#0
    LDR R2, =#48100
    LDR R3, =COLOR_RED

    loopj:
        STR R3, [R1, R2]
        ADD R2, #960
        ADD R0, #1
        CMP R0, #250
        BLO loopj
    
	bx		lr

	.end
