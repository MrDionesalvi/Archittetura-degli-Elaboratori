.globl _start
.data
    num: .dword 10
.text
_start:
    # call serief
    la    a0, num
    lw    a0, 0(a0)
    jal   ra, serief

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione serief nel campo di sotto
serief:
	li t0, 3
	bgt a0, t0, OK
	li a0, 1
	ret	
OK:
	addi sp, sp, -32
	sd a0, 0(sp)
	sd ra, 8(sp)
	sd s0, 16(sp)
	
	addi a0, a0, -1
	jal ra, serief
	mv s0, a0

	ld a0, 0(sp)
	addi a0, a0, -2
	jal ra, serief
	add s0, s0, a0
	
	ld a0, 0(sp)
	addi a0, a0, -3
	jal ra, serief
	add a0, s0, a0

	ld ra, 8(sp)
	ld s0, 16(sp)
	addi sp, sp, 32
	
	ret	
	