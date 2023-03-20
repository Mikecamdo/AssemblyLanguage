		.syntax     unified
		.cpu        cortex-m4

		.data
array:	.word	23355
		.word	22843
		.word	23175
		.word	17158

		.text
		.global		average1
		.thumb_func
		.align
average1:				// Function entry point
//	Add your assembly code here
		LDR R2, =array

		LDR R0, [R2, #0]
		LDR R1, [R2, #4]
		ADD R0, R1

		LDR R1, [R2, #8]
		ADD R0, R1

		LDR R1, [R2, #12]
		ADD R0, R1

		LDR R1, =#4
		UDIV R0, R1
		bx	lr			// Return average

		.global		average2
		.thumb_func
		.align
average2:				// Function entry point
//	Add your assembly code here
		LDR R5, =array
		LDR R4, =#0

		LDR R0, [R5, R4, LSL #2]
		ADD R4, #1

		LDR R1, [R5, R4, LSL #2]
		ADD R4, #1
		ADD R0, R1

		LDR R2, [R5, R4, LSL #2]
		ADD R4, #1
		ADD R0, R2

		LDR R3, [R5, R4, LSL #2]
		ADD R4, #1
		ADD R0, R3

		LDR R1, =#4
		UDIV R0, R1
		
		bx	lr			// Return average

		.end
