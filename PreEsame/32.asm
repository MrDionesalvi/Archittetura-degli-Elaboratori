.globl _start
.data
    num: .dword 5
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
	bnez a0, NEX
	li a0, 0
	ret
NEX:
	li t0, 1
	bne a0, t0, NEXT
	li a0, 1
	ret
NEXT:
	addi sp, sp, -24
	sd a0, 0(sp)
	sd ra, 8(sp)
	sd s0, 16(sp)
	
	addi a0, a0, -1
	jal ra, fib
	mv s0, a0 # s0 = fib(n-1)
	
	ld a0, 0(sp)
	addi a0, a0, -2
	
	jal ra, fib
	add a0, s0, a0 # a0 = fib(n-1) + fib(n-2)
	
	ld ra, 8(sp)
	ld s0, 16(sp)
	addi sp, sp, 24
	
	ret
	
	
