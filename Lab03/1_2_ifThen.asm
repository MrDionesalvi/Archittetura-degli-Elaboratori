.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 0 # x
	li t1, 6 # y
	
	# x = (x - 2) + y
	addi t0, t0, -2
	add t0, t0, t1
	
	bge t0, t1, ELSE
	addi t0, t0, 1
	beq zero, zero, ENDIF
ELSE:	addi t1, t1, 1
ENDIF: 


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
