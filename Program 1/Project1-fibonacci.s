		.syntax     unified
		.cpu        cortex-m4

		.bss
callnum:.word 0
prev1:	.word 0
prev2:	.word 0

//		Write code here for the data words in the .bss section
//		to be initialized to zero

		.text
		.global		init_fibonacci
		.thumb_func
		.align
init_fibonacci:
//		Write code here for the init_fibonacci function
		MOV R0, #0

		LDR R1, =callnum //Initialize callnum to 0
		STR R0, [R1]

		LDR R2, =prev1 //Initialize prev1 to 0
		STR R0, [R2]

		LDR R3, =prev2 //Initialize prev2 to 0
		STR R0, [R3]
		bx	lr

		.global		fibonacci
		.thumb_func
		.align
fibonacci:
//		Write code here for the fibonacci function
		LDR R1, =callnum
		LDR R2, =prev1
		LDR R3, =prev2

		LDR R12, [R1]

		CMP R12, #2 //If callnum == 2
		BEQ equal_two

		CMP R12, #1 //If callnum == 1
		BEQ equal_one

		CMP R12, #0 //If callnum == 0
		BEQ equal_zero

		B end
equal_two:

		LDR R0, [R2]
		LDR R12, [R3]
		ADDS R0, R12 //prev1 + prev2
		BCS overflow //if prev1 + prev2 causes an overflow

		LDR R12, [R2]
		STR R12, [R3] //prev2 = prev1
		STR R0, [R2] //prev1 = currentNum
		MOV R12, #2

		B end
equal_one:
		LDR R12, =#1
		STR R12, [R2] //prev1 = 1
		LDR R12, =#2 //callnum = 2
		LDR R0, =#1 //return 1

		B end
equal_zero:
		LDR R12, =#1 //callnum = 1
		LDR R0, =#0 //return 0

		B end
overflow:
		LDR R0, =#0xFFFFFFFF //return overflow indicator
		bx lr
end:
		STR R12, [R1] //update callnum

		bx  lr

		.end
