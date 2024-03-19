.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 7 # Per test non del frammento
	li t1, 6 # // 
	
	sub t0, t0, t1
	bge t0, zero, ELSE
	li t0, 0
ELSE:	addi t1, t1, -1


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
