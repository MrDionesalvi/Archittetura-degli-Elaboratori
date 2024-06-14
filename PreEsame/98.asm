.globl _start
.data
  size:  .word  10
  array: .word  1,3,5,6,7,8,9,25,30,40

.text
_start:
    # chiama issorted
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, issorted
    
    #exit
    li   a7, 10
    ecall   

#****************************************************
# completare la funzione issorted nel campo di sotto    
issorted:
	li t0, 0
	addi a1, a1, -1
TOP:
	bge t0, a1, END
	lw t1, 0(a0)
	lw t2, 4(a0)
	bgt t1, t2, NOT
	addi a0, a0, 4
	addi t0, t0, 1
	j TOP
NOT:
	li a0, 0 
	jr ra
END:
	li a0, 1
	jr ra