//
// User LD3: The green LED is a user LED connected to the I/O PG13 of the STM32F429ZIT6.
// User LD4: The red LED is a user LED connected to the I/O PG14 of the STM32F429ZIT6.
//

	.syntax     unified
	.cpu        cortex-m4
	.equ RCC_AHB1ENR, 0x40023830
    .equ GPIOG_MODER, 0x40021800
    .equ GPIOG_OTYPER,0x40021804
    .equ GPIOG_OSPEEDR,0x40021808
    .equ GPIOG_IDR,   0x40021810
    .equ GPIOG_ODR,   0x40021814

	.text

//
// Function to set up bits 14 and 13 of the GPIO port G to drive the
// red and green user LEDs. The bits are set to general purpose output
// mode with high speed. There are no arguments or a return value.
//
	.global		setupLEDs
	.thumb_func
	.align
setupLEDs:
// Complete your assembly code here
	LDR R0, =RCC_AHB1ENR
	LDR R1, [R0]
	ORR R1, #0x40
	STR R1, [R0]
	LDR R0, =GPIOG_MODER
	LDR R1, [R0]
	BIC R1, #0x28000000
	ORR R1, #0x14000000
	STR R1, [R0]
	LDR R0, =GPIOG_OSPEEDR
	LDR R1, [R0]
	ORR R1, #0x3C000000
	STR R1, [R0]

	bx	lr

//
// Function to set the state of the two user LEDs. There are
// two uint32_t arguments expected. The first argument controls
// the red LED on bit 14 of GPIO port G, and the second argument
// controls the green LED on bit 13 of GPIO port G. Each argument
// may be 0 or 1, signifying the corresponding LED is turned on
// or off, respectively. There is no return value.
//
	.global		setLEDs
	.thumb_func
	.align
setLEDs:
// Complete your assembly code here
	LDR R2, =GPIOG_ODR
	LDR R3, [R2]

	CMP R0, #0x1
	ITE EQ
	ORREQ R3, #0x4000
	BICNE R3, #0x4000

	CMP R1, #0x1
	ITE EQ
	ORREQ R3, #0x2000
	BICNE R3, #0x2000

	STR R3, [R2] 
	bx	lr
	.end
