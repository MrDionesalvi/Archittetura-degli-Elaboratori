.globl _start

.text

_start:
  li t0, 20 # a
  li t1, 10 # b
  li t2, 10 # R

  li t3, 0 # i
TOP:
  bge t3, t0, END
  li t4, 0 # j
TOP2:
  bge t4, t1, END2
  add t5, t2, t2
  add t5, t5, t3
  add t5, t5, t4
  mv t2, t5
  addi t4, t4, 1
  j TOP2
END2:
  addi t3, t3, 1
  j TOP
  
END:

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
