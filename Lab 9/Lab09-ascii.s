    .syntax     unified
	.cpu        cortex-m4
    .text

	.global		lo2up
    .thumb_func
    .align
lo2up:
// Complete this function with your assembly code
    loop1:
        LDRB R1, [R0]

        CMP R1, #97 
        BLO no_change //if character is less than 'a'
        CMP R1, #122 
        BHI no_change //if character is less than 'z'

        EOR R1, #32 //if character is between 'a' and 'z' (inclusive)
        STRB R1, [R0]
        ADD R0, #1
        LDRB R1, [R0]

        CMP R1, #0
        BNE loop1

no_change:
    STRB R1, [R0]
    ADD R0, #1
    LDRB R1, [R0]

    CMP R1, #0
    BNE loop1


	.global		up2lo
    .thumb_func
    .align
up2lo:
// Complete this function with your assembly code

    loop2:
        LDRB R1, [R0]

        CMP R1, #65 
        BLO no_change2 //if character is less than 'A'
        CMP R1, #90 
        BHI no_change2 //if character is less than 'Z'

        ORR R1, #32 //if character is between 'A' and 'Z' (inclusive)
        STRB R1, [R0]
        ADD R0, #1
        LDRB R1, [R0]

        CMP R1, #0
        BNE loop2

no_change2:
    STRB R1, [R0]
    ADD R0, #1
    LDRB R1, [R0]

    CMP R1, #0
    BNE loop2

	.global		findchr
    .thumb_func
    .align
findchr:
// Complete this function with your assembly code

    loop3:
        LDRB R2, [R0]
        CMP R2, R1
        BEQ end
        ADD R0, #1
        LDRB R2, [R0]
        CMP R2, #0
        BNE loop3
    
    MOV R0, #0
    B end
end:
    bx lr

	.end
