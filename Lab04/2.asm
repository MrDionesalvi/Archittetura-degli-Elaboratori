.globl _start
.data        
    x: .word 1
    y: .word 2
    z: .word 3
    result: .word 0
        
.text
_start:   
    la t0, x
    lw t1, 0(t0)
    lw t2, 4(t0)
    lw t3, 8(t0)
    addi t4, zero, 4

	add t4, t1, zero # r = x
	
	bgt t4, t2, THEN # x < y
	add t4, t2, zero
THEN:	
    bgt t4, t3, END # (x or y) < z
	add t4, t3, zero
END: 
    sw t4, 12(t0)