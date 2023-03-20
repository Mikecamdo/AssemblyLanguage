		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		diff
		.thumb_func
		.align
diff:					// Function entry point
		svc #0 // Debug breakpoint
		mov R2, #0 // Move constant 0 to R2
		svc #0 // Debug breakpoint
		subs R2, R1 // Subtract R1 from R2
		svc #0 // Debug breakpoint
		adds R3, R2, R0 // Add R2 to R0 and store in R3
		svc #0 // Debug breakpoint
		subs R0, R1 // Subtract R1 from R0
		svc #0 // Debug breakpoint
		bx lr // Return to calling program

		.end