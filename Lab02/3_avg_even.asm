# calculate the average of the two even numbers in x5 and x6. Put result in x7
.globl _start

.text
_start:
    addi x5, x0, 8    # load the numbers in the registers
    addi x6, x0, 2
    add  x7, x5, x6   # sum them
    srli x7, x7, 1    # divide by two

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

