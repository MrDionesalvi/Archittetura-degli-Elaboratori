.globl _start
.data
    srcstr: .string  "string to be copied"
    dststr: .string  "destination string is long enough"
.text
_start:
    
    # chiama strcpy    
    la   a0, srcstr
    la   a1, dststr
    jal  ra, strcpy

    #exit
    li   a7, 10
    ecall

#*******************************************************************************
# strlen
# a0 - str
#*******************************************************************************
# usate il vostro codice fatto in precedenza per strlen
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
# completare la funzione strcpy nel campo di sotto
strcpy:

	addi sp, sp, -12
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw ra, 8(sp)
	
	jal ra, strlen
	add t0, zero, a0
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	
	addi sp, sp, -16
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw t0, 8(sp)
	sw ra, 12(sp)
	
	add a0, zero, a1
	jal ra, strlen
	add t1, zero, a0
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw t0, 8(sp)
	lw ra, 12(sp)
	addi sp, sp, 16
	
	li t2, 0 # i
INIZIO:
	bge t2, t0, FINE
	lbu t3, 0(a0)
	sb t3, 0(a1)
	addi a0, a0, 1
	addi a1, a1, 1
	addi t2, t2, 1
	j INIZIO

FINE:
	bge t2, t1, EXT
	sb zero, 0(a1)
	addi a1, a1, 1
	addi t2, t2, 1
	
EXT:
	jr ra
	