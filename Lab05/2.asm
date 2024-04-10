.globl _start
.data
    d: .byte '1'
.text
_start:
    # call digit
    la   a0, d
    lbu  a0, 0(a0)
    jal  ra, digit

    #exit
    li   a7, 10
    ecall

digit:
	li t0, 48
	li t1, 57
	li t3, 1
	blt a0, t0, END
	bgt a0, t1, END
	add a0, zero, t3
	jr ra    
END:     
	add a0, zero, zero
	jr ra
     
	
