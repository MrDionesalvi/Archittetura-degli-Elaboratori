.globl _start

.text

_start:
  li t0, 20 # x
  li t1, 30 # y
  li t2, 20 # z
  
  li t3, 0  # max
  mv t3, t0
  
  bgt t3, t1, SECOND # x < y
  mv t3, t1

SECOND:
  bgt t3, t2, END
  mv t3, t2
  
END:
  


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
