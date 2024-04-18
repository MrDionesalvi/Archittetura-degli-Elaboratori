.globl _start
.data
    num1: .dword 5
    num2: .dword 6
.text
_start:
    # call MCD
    la    a0, num1
    la    a1, num2
    ld    a0, 0(a0)
    ld    a1, 0(a1)     
    jal   ra, mcm

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione MCM nel campo di sottoù
mcm:
	addi sp, sp, -24
	sd a0, 0(sp)
	sd a1, 8(sp)
	sd ra, 16(sp)
	
	jal ra, mcd
	add t0, zero, a0 # MCD(a,b)
	ld a0, 0(sp)
	ld a1, 8(sp)
	ld ra, 16(sp)
	addi sp, sp, 24
	
	mul t2, a0, a1
	div a0, t2, t0
	
	jr ra
	