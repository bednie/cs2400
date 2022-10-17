.data
x: .word 2
before_msg: .asciiz "The value of x before subfun is: "
after_msg: .asciiz "\nThe value of x after subfun is: "

# .globl main
.text
main:	
	li $v0,4
	la $a0,before_msg
	syscall 
	
	li $v0,1
	lw $a0,x($0)
	syscall 
	
	lw $a0,x($0) # load x 
	
	jal subfunc # call subfunc
	
	sw $v0,x($0) # store x 
	
	li $v0,4
	la $a0,after_msg
	syscall 
	
	li $v0,1
	lw $a0,x($0)
	syscall 
	
	li $v0,10 	# exit
	syscall