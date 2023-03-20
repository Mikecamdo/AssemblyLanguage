		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		determinant
		.thumb_func
		.align
determinant:
// Complete this function with your assembly code
		VLDR S0, [R0] //S0 = a11
		ADD R0, #12
		VLDR S1, [R0] //S0 = a22

		VMUL.F32 S0, S1 //S0 = a11 * a22

		SUB R0, #8
		VLDR S1, [R0] //S1 = a12
		ADD R0, #4
		VLDR S2, [R0] //S2 = a21

		VMUL.F32 S1, S2 //S1 = a12 * a21

		VSUB.F32 S0, S1 //S0 = a11 * a22 - a12 * a21
		
		bx	lr
		.end