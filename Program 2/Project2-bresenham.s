// Follows the integer arithmetic algorithm at
// https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
		.syntax     unified
		.cpu        cortex-m4

		.equ DISPLAY, 0xD0000000
		.equ COLOR_BROWN, 0xFFA52A2A

		.text
		.global		bresenham
		.thumb_func
		.align
bresenham:
//              Write code here for the bresenham function
		PUSH {R4-R11}

		//R0 = x_0
		//R1 = y_0
		//R2 = x_1
		//R3 = y_1
		LDR R4, =DISPLAY
		LDR R5, =COLOR_BROWN
		
 		LDR R10, =#2 //R10 = 2

		SUB R6, R2, R0 //R6 = dx
		SUB R7, R3, R1 //R7 = dy

		//R11 = D
		MUL R11, R10 //D = 2 * dy
		SUB R11, R6 //D = D - dx

		loop:
			LDR R8, =#240 //R8 = 240
			MUL R9, R1, R8 //R9 = y_0 * 240
			ADD R9, R0 //R9 = R9 + x_0
			STR R5, [R4, R9, LSL #2] //plot(x,y)

			CMP R11, #0
			ITTT GT //if D > 0
			ADDGT R1, #1 //y = y + 1
			MULGT R12, R10, R6 //R12 = 2 * dx
			SUBGT R11, R12 //D = D - R12

			MUL R12, R10, R7 //R12 = 2 * dy
			ADD R11, R12 //D = D + R12

			ADD R0, #1
			CMP R0, R2
			BLE loop


 		POP {R4-R11}
		bx lr
		.end
