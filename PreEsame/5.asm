.globl _start

.text

_start:
  li t0, -2 # x
  li t1, 1 # mask
  li t2, 0
 
TOP:
  beqz t0, END
  andi t1, t0, 1
  add t2, t2, t1
  srli t0, t0, 1
  j TOP
 END:
 


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
