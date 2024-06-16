  .globl _start
  .data
    size:  .word  10
    array: .word  3,1,6,6,23,17,9,25,3,4
  
  .text
  _start:
      # chiama minarray
      la   a0, array
      la   a1, size
      lw   a1, 0(a1)
      jal  ra, minarray
      
      #exit
      li   a7, 10
      ecall   

#****************************************************
# completare la funzione minarray nel campo di sotto
minarray:
	li t0, 0	#min_idx
	lw t1, 0(a0)	#min_val
	li t2, 1	#i

TOP:
	bge t2, a1, END
	addi a0, a0, 4
	lw t3, 0(a0)
	bge t3, t1, SKIP
	mv t0, t2 # min_idx = i
	mv t1, t3 # min_val = array[i]	
SKIP:
	addi t2, t2, 1
	j TOP
END:
	mv a0, t0
	ret