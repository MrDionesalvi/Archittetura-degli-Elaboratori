.globl _start
.data
    str1: .string  "first."
    str2: .string  "second."
.text
_start:
    # call strcmp
    la   a0, str1
    la   a1, str2
    jal  ra, strcmp

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione strcmp nel campo di sotto
strcmp:

TOP:	
	lbu t0, 0(a0)
	lbu t1, 0(a1)
	
	beqz t0, END
	beqz t1, END2
	bne t0, t1, END2
	addi a0, a0, 1
	addi a1, a1, 1
	j TOP

END:
	bnez t1, END2
	li a0, 0
	jr ra

END2:
	li a0, 1
	jr ra