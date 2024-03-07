# sum three numbers loaded in x5, x6, x7 and put the result in x28
.globl _start

.text
_start:
    addi x5, x0, 41     # load the numbers nei registri
    addi x6, x0, 43
    addi x7, x0, 47
    add  x28, x5, x6    # perform the sums
    add  x28, x28, x7

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
