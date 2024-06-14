.globl _start
.data
    numstr: .string  "1234a"
.text
_start:
    # call isnumber
    la   a0, numstr
    jal  ra, isnumber

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# digit
# a0 - char
# return 1 if char is a digit, 0 otherwise
#*******************************************************************************
digit:
    li t0, 48
    li t1, 57
    blt a0, t0, return_0
    bgt a0, t1, return_0
    li a0, 1
    ret
return_0:
    li a0, 0
    ret

#****************************************************
# completare la funzione isnumber nel campo di sotto
isnumber:
	
TOP:	
	addi sp, sp, -16
	sw a0, 0(sp)
	sd ra, 8(sp)
	
	lbu a0, 0(a0)
	beqz a0, END
	jal ra, digit
	ld ra, 8(sp)
	bnez a0, OTP
	addi sp, sp, 16
	li a0, 0
	jr ra
OTP:
	lw a0, 0(sp)
	addi sp, sp, 16
	addi a0, a0, 1
	j TOP
		
END:
	addi sp, sp, 16
	li a0, 1
	jr ra