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
	
	bnez t0, CONTINUE
	bnez t1, CONTINUE
	j FINISH
CONTINUE:
	bne t0, t1, END
	addi t3, zero, 1
	addi a0, a0, 1
	addi a1, a1, 1
	j TOP

FINISH:
	addi a0, zero, 0
	jr ra

END:
	addi a0, zero, 1
	jr ra