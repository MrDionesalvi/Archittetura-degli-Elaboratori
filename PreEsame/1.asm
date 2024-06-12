.globl _start

.text

_start:
  li t0, 20 # x
  li t1, 10 # y
  
  addi t0, t0, -2
  add t0, t0, t1
  
  bge t0, t1, ELSE
  addi t0, t0, 1
  j END

ELSE:
  addi t1, t1, 1
 
END:


exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
