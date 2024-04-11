.globl _start
.data
    str:  .string "my long string"
    c:    .byte 'g'
.text
_start:
    # call strchridx
    la   a0, str
    la   a1, c
    lb   a1, 0(a1)
    jal  ra, strchridx

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione strchr nel campo di sotto

strchridx:
	li t1, 0
TOP:
	lbu t0, 0(a0)
	
	beq t0, zero, END
	beq t0, a1, FOUND
	addi t1, t1, 1
	addi a0, a0, 1
	j TOP
FOUND:
	add a0, zero, t1
	jr ra
END:
	addi a0, zero, -1
	jr ra