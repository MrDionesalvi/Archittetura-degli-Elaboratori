.globl _start

.data 
	x: .byte 79
	y: .byte 49
.text

_start:
    la t0, x
    lb t0, 0(t0)
    la t1, y
    lb t1, 0(t1)
    add t0, t1, t0
    la t2, y
    sb t0, 0(t2)
    lb t0, 0(t2)

    # t0 = 1010000 --> 0110000 

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
