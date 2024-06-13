.globl _start
.data
    size:   .word  8                  # size of the array        
    array:  .dword 8,7,6,5,4,3,2,1    # array of long integers

.text
_start:
    la t0, size
    
    lw t0, 0(t0)
    addi t0, t0, -1 # size = size -1
    li t1, 1
    
WHILE:    
    beqz t1, END # Inizio while
    	li t1, 0 # change = 0
    	li t2, 0 # i 
  	la t3, array	# array[0]
  	la t4, array   
  	addi t4, t4, 8 # array[1]
FOR:    		
    		bge t2, t0, ENDFOR
    		ld t5, 0(t3)
    		ld t6, 0(t4)
    		ble t5, t6, NOIF
 		sd t5, 0(t4)
 		sd t6, 0(t3)
 		li t1, 1	   		
NOIF:    		
		addi t3, t3, 8
		addi t4, t4, 8
    		addi t2, t2, 1
    		j FOR
ENDFOR:
	j WHILE
END:
	
    			