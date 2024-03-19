.globl _start

.data 
	# variables here 
.text

_start:
	li t0, 50
	li t1, 40
	li t2, 30
	
	ble t0, t1, SECOND 
	ble t0, t2, FIRST
	add t3, t0, zero # max = t0
	beq zero, zero, END
FIRST:  add t3, t1, zero # max = t1
	beq zero, zero, END
SECOND: ble t1, t2, THIRD
	add t3, t1, zero # max = t1
	beq zero, zero, END
THIRD: 	add t3, t2, zero # max = t2
	
END: 
print:
        addi  a0, t3, 0    	 # print the result
        li    a7, 1
        ecall
	


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
