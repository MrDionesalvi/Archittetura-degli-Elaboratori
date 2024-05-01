.globl _start
.data
    num: .dword 12
.text
_start:
    # call fib
    la    a0, num
    ld    a0, 0(a0)
    jal   ra, fib

    #exit
    li    a7, 10
    ecall

#****************************************************
# completare la funzione fib nel campo di sotto
fib:
	beqz a0, ENDSEQ
	li t6, 1
	beq a0, t6, ENDI
	
	addi sp, sp, -24
	sd a0, 0(sp)
	sd ra, 8(sp)
	
	addi a0, a0, -1
	jal ra, fib
	add t0, zero, a0
	
	ld a0, 0(sp)
	ld ra, 8(sp)
	sd t0, 16(sp)
	
	addi a0, a0, -2
	jal ra, fib
	add t1, zero, a0
	ld a0, 0(sp)
	ld ra, 8(sp)
	ld t0, 16(sp)
	addi sp, sp, 24
	
	add a0, t0, t1
	jr ra
	
	
	
ENDSEQ:
	add a0, zero, zero
	jr ra
ENDI:
	addi a0, zero, 1
	jr ra