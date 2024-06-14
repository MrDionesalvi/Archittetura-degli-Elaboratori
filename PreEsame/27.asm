.globl _start
.data
      buffer: .string  "BADPass4"
.text
_start:
    # call passrules
    la   a0, buffer
    jal  ra, passrules

    #exit
    li   a7, 10
    ecall

contains:
	li t0, 0
TOP:	
	lbu t1, 0(a0)
	beq t1, zero, ENDS
	blt t1, a1, END
	bgt t1, a2, END
	addi a0, zero, 1
	jr ra

ENDS:
	addi a0, zero, 0
	jr ra

END:
	addi a0, a0, 1
	j TOP
	
#****************************************************
# completare la funzione passrules nel campo di sotto
passrules:
	addi sp, sp, -32
	sd a0, 0(sp)
	sd ra, 8(sp)
	sd s0, 16(sp)
	sd s1, 24(sp)

	
	li a1, 65
	li a2, 90
	jal ra, contains
	mv s0, a0
	
	ld a0, 0(sp)	
	li a1, 48
	li a2, 57
	jal ra, contains
	
	mv s1, a0
	
	and a0, s0, s1
	ld ra, 8(sp)
	ld s0, 16(sp)
	ld s1, 24(sp)
	addi sp, sp, 32
	
	ret