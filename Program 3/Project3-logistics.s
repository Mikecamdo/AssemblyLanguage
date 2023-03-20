		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		map
		.thumb_func
		.align
map:
//              Write code here for the map function
		//S0 = r
		//S1 = x0
		//R0 = array
		//R1 = arraySize

		VMOV S3, #1
		MOV R2, #0
		loop1:
			VMUL.F32 S2, S0, S1 //S2 = r * xi
			VSUB.F32 S4, S3, S1 //S4 = 1 - xi
			VMUL.F32 S2, S4 //S2 = r * xi * (1 - xi)
			VMOV S1, S2 //update xi

			ADD R2, #1
			CMP R2, #100
			BLO loop1

		MOV R2, #0
		loop2:
			VMUL.F32 S2, S0, S1 //S2 = r * xi
			VSUB.F32 S4, S3, S1 //S4 = 1 - xi
			VMUL.F32 S2, S4 //S2 = r * xi * (1 - xi)
			VMOV S1, S2 //update xi

			VSTR S1, [R0] //store value in array
			ADD R0, #4 //go to next array value		

			ADD R2, #1
			CMP R2, R1
			BLO loop2


		bx	lr
		.end
