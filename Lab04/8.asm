.globl _start
.data        
  size:   .word 8
  array:  .dword 8,7,6,5,4,3,2,1
.text
_start:
	la t0, size
	lw t0, 0(t0) # size
	
	la t1, array
	la t6, array
	
	addi t6, t6, 8
	
	li t3, 0 # Counter del for
	li a2, 1

	addi t0, t0, -1
TOP:
	beq a2, zero, END
	add a2, zero, zero

FTOP:	
	bge t3, t0, FEND
	ld t4, 0(t1) # Carico in t4, il valore dell'aray nella posizione i
	ld t5, 0(t6)
	ble t4, t5, SKIP
	
	sd t4, 0(t6)
	sd t5, 0(t1)
	addi a2, zero, 1

SKIP:		
	addi t1, t1, 8
	addi t3, t3, 1
	addi t6, t6, 8
	j FTOP
FEND:
	li t3, 0
	la t1, array
	la t6, array
	addi t6, t6, 8
	j TOP
END:


	
print:
        addi  a0, t2, 0    	 # print the result
        li    a7, 1
        ecall
	

	
