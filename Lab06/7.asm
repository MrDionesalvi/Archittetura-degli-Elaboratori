.globl _start
.data
      buffer: .string  "BADPass45"
.text
_start:
    # call passrules
    la   a0, buffer
    jal  ra, passrules

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione passrules nel campo di sotto
	passrules:
	li a1, 65
	li a2, 90
	
	addi sp, sp, -8
	sw a0, 0(sp)
	sw ra, 4(sp)
	
	jal ra, contains
	add t0, zero, a0
	lw a0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	
	li a1, 48
	li a2, 57
	addi sp, sp, -12
	sw a0, 0(sp)
	sw t0, 4(sp)
	sw ra, 8(sp)
	
	jal ra, contains
	add t1, zero, a0
	lw a0, 0(sp)
	lw t0, 4(sp)
	lw ra, 8(sp)
	addi sp, sp, 12
	
	and a0, t0, t1
	
	jr ra