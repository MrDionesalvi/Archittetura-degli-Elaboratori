.globl _start
.data        
  size:   .word 8
  array:  .dword 1, 2, 3, 4, 5, 6, 7, 8
  result: .word -1    
.text
_start:
	la t0, size
	lw t0, 0(t0) # size
	addi t0, t0, -1
	
	la t1, array
	li t2, 1 # Result
	li t3, 0 # Counter del for


	
TOP:	bgt t3, t0, END
	ld t4, 0(t1) # Carico in t4, il valore dell'aray nella posizione i
	ld t5, 8(t1)
	
	ble t4, t5, CONTINUE
	add t2, zero, zero
	j END

CONTINUE:
		
	addi t1, t1, 8
	addi t3, t3, 1
	j TOP
END:

	la t6, result
	sw t2, 0(t6) 
	
print:
        addi  a0, t2, 0    	 # print the result
        li    a7, 1
        ecall
	

	
