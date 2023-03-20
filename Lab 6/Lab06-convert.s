    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		int2asc
    .thumb_func
    .align
int2asc:
// Your assembly code goes here
    CMP R0, #10
    ITE LO
    ADDLO R0, #0x30
    ADDHS R0, #0x37

	bx	lr

	.global		asc2int
    .thumb_func
    .align
asc2int:
// Your assembly code goes here
    CMP R0, #0x3A
    ITE LO
    SUBLO R0, #0x30
    SUBHS R0, #0x37
    
	bx	lr
	.end
