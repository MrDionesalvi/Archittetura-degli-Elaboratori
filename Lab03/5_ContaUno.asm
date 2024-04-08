.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 37 # t0 = N = 37
	li t1, 1 # AND MASK
	li t2, 0 # Counter

	
TOP:    beq t0, zero, END
	and t3, t0, t1
	bne t3, t1, NOUNO
	addi t2, t2, 1
NOUNO:
	srli t0, t0, 1
	j TOP
END: 

print:
        addi  a0, t2, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
