		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		ufunc
		.thumb_func
		.align
ufunc:					// Function entry point
//	Write your assembly code here
		MOV R2, R0
		UDIV R0, R1
		MUL R0, R1
		SUB R2, R0
		MOV R0, R2
		bx	lr			// Return to calling program

		.global		sfunc
		.thumb_func
		.align
sfunc:					// Function entry point
//	Write your assembly code here
		MOV R2, R0
		SDIV R0, R1
		MUL R0, R1
		SUB R2, R0
		MOV R0, R2
		bx	lr			// Return to calling program

		.end
