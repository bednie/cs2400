.data 
array:	.word 1,2,3,4
comma: .asciiz ","
newline: .asciiz "\n"
before:	.asciiz "Before swap: \n"
after: .asciiz "After swap: \n"

.text
# check array values before swap                
li $v0, 4		# print "Before swap" message
la $a0, before
syscall 

li $v0, 1      	 	# print()
lw $a0, array+0		# first index of array
syscall 	

li $v0, 4      	 	# print()
la $a0, comma	        # comma
syscall 

li $v0, 1      	 	# print()
lw $a0, array+8		# third index of array
syscall 

li $v0, 4      	 	# print()
la $a0, newline	        # newline
syscall 

# swap values of first index and third index of array 
lw $t2,array+0
lw $t3,array+8

sw $t3,array+0
sw $t2,array+8

# check array values after swap			
li $v0, 4		# print "After swap" message
la $a0, after
syscall 

li $v0, 1      	 	# print()
lw $a0, array+0		# first index of array
syscall 	

li $v0, 4      	 	# print()
la $a0, comma	        # comma
syscall 

li $v0, 1      	 	# print()
lw $a0, array+8		# third index of array
syscall 

# exit                                          
li $v0,10
syscall      	

