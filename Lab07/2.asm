.globl _start
.data
    numstr: .string  "123"
.text
_start:
    # chiama strlen per ottenere la lunghezza della stringa
    la   a0, numstr
    jal  ra, strlen
    
    # chiama atoi
    mv   a1, a0
    la   a0, numstr
    jal  ra, atoi

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
# usare la funzione strlen sviluppata in precedenza 
strlen:
	li t0, 0
TOP:
	lbu t1, 0(a0)
	beq t1, zero, END
	addi a0, a0, 1
	addi t0, t0, 1
	j TOP

END:
	add a0, zero, t0
	jr ra
#****************************************************
# completare la funzione atoi nel campo di sotto
atoi:
    beqz a1, ENDARRAY
    addi sp, sp, -16
    sw a0, 0(sp)
    sw a1, 4(sp)
    sw ra, 8(sp)

    addi t0, a1, -1 # t0 = n-1
    add t1, a0, t0  # t1 = str + n
    lbu t0, 0(t1)   # t0 = str[n]
    addi t2, zero, 48 # t2 = '0'

    sub t0, t0, t2 # t0 = str[n-1] - '0'
    sw t0, 12(sp)

    addi a1, a1, -1
    jal ra, atoi

    lw t0, 12(sp)
    li t1, 10
    mul t1, t1, a0
    add t0, t1, t0
    lw a0, 0(sp)
    lw a1, 4(sp)
    lw ra, 8(sp)
    addi sp, sp, 16

    add a0, zero, t0
    jr ra

ENDARRAY:
    add a0, zero, zero
    jr ra
