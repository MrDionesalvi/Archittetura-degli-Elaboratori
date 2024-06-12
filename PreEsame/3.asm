.globl _start

.text

_start:
  li t0, 3 # n
  li t1, 1 # r
  li t2, 0 # A
  li t3, 1 # B
  
 TOP:
  blez t0, END
  add t1, t2, t3
  mv t2, t3
  mv t3, t1
  addi t0, t0, -1
  j TOP
END:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
