		.syntax     unified
		.cpu        cortex-m4

		.text
		.global		func
		.thumb_func
		.align
func:					// Function entry point
//	Add your assembly code here
		LDR R1, =0xD0000000
		LDR R2, =#144400
		LDR R3, =0xFFFF0000
		.rept 10
		STR R3, [R1, R2]
		ADD R2, #960
		.endr
		bx	lr			// Function return

		.end
