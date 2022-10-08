.data
Database: .word 1,2,3,4,5,6,7,8,9,10
message: .asciiz "The number of elements in the Database greater than 5 is: "
greater_msg: .asciiz " is greater than 5.\n"
less_msg: .asciiz " is less than or equal to 5.\n"

.text 
la $s0,($0) 			# $s1: counter for number of elements that are greater than 5
la $s1,($0) 			# $s2: control variable for loop increment (by multiples of 4)

# for loop
loop: 	bge $s1,40,end 	# branch if loop has iterated 10 times (10 * 4 bytes = 40 bytes)
	lw $t0,Database($s1)	# load word in Database
	addi $s1,$s1,4 		# increment control variable by 4, also moving index to next word in Database
	bgt $t0,5,greater	# branch if Database element is greater than 5
	
	li $v0,1		# print value of element at index
	la $a0,($t0)
	syscall
	li $v0,4		# print less or equal message
	la $a0,less_msg
	syscall 
	
	j loop

end: 	li $v0,4 		# print the message 
	la $a0,message
	syscall
	li $v0,1		# print the number of elements greater than 5 in the database
	la $a0,($s0)
	syscall
	
exit: li $v0,10
	syscall
	
greater: addi $s0,$s0,1 	# increment number of elements greater than 5

	li $v0,1		# print value of element at index
	la $a0,($t0)
	syscall
	li $v0,4		# print greater than message
	la $a0,greater_msg
	syscall
	
	j loop			# go back to loop for next iteration
