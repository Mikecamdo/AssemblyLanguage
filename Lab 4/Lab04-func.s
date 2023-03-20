		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		ufunc
		.thumb_func
		.align
ufunc:					// Function entry point
//	Write your assembly code here
		LSL R0, R1
		SVC #0
		LSR R0, R1
		bx	lr			// Return to calling program

		.global		sfunc
		.thumb_func
		.align
sfunc:					// Function entry point
//	Write your assembly code here
		LSL R0, R1
		SVC #0
		ASR R0, R1
		bx	lr			// Return to calling program

		.end