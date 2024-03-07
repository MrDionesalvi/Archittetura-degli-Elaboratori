.globl _start

.text
_start:
    li x5, 0x0000000000000000
    li x6, 0xFFFFFFFFFFFFFFFF

    addi x7, x0, 0x3f  # Crea una "bit mask" da 6 bit
    slli x7, x7, 11    # Shift la mask verso i bit [16-11]
    and  x28, x5, x7   # x28 ha i bit [16-11] uguale a x5 (altri = 0)

    slli x7, x7, 15    # sposta la mascara "sopra" i bit [31-26]
    xori x7, x7, -1    # inverte i bit (NOT bit a bit)
    and  x6, x6, x7    # "Zero out" bit [31-26] di x6

    slli x28, x28, 15  # sposto i bit da x5 salvati in x28
    or   x6, x6, x28   # carico i bit nelle posizioni [31-26] di x6

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall

