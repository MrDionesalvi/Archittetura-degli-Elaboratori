.globl _start

.text

_start:
  li t0, 3 # n
  
  li t1, 0 # s
  li t2, 1 # i
 
TOP: 
  bgt t2, t0, END
  mul t3, t2, t2
  add t1, t1, t3
  addi t2, t2, 1
  j TOP
 
END:


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
