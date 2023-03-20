    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		int2asc
    .thumb_func
    .align
int2asc:
// Your assembly code goes here
    ADD R0, #0x30

    CMP R0, #0x3A
    IT HS
    ADDHS R0, #0x07

	bx	lr

	.global		asc2int
    .thumb_func
    .align
asc2int:
// Your assembly code goes here
    SUB R0, #0x30
    CMP R0, #10
    IT HS
    SUBHS R0, #7    
	bx	lr
	.end
