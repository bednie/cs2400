.data
answer: .word 10
user_prompt: .asciiz "What is the result of 5+5? Type in your answer here:\n"
correct_msg: .asciiz "Correct!\n"
incorrect_msg: .asciiz "Wrong answer! You have "
incorrect_2_msg: .asciiz " tries remaining. Try again.\n\n"
lose_msg: .asciiz "Wrong answer! Your three tries are up. Game over.\n"

.text
li $s0,3 				# initiliaze tries variable
lw $s2,answer

try: 	li $v0,4
	la $a0,user_prompt
	syscall

	li $v0,5 			# get user input
	syscall
	move $s1,$v0 			# store in $s1


	beq $s1,$s2,win			# check user input. branch if user's input equals answer
		
	subi $s0,$s0,1 			# decrement tries	
	beqz $s0,lose 			# if wrong and tries are up, user lost
	j next_try
	
exit: li $v0,10
	syscall
	
win: li $v0,4 				# print win message then exit
	la $a0,correct_msg
	syscall
	j exit

next_try: li $v0,4 			# print incorrect message then 
	la $a0,incorrect_msg
	syscall
	li $v0,1			# print remaining number of tries 
	la $a0,($s0)
	syscall
	li $v0,4 			# print second part of incorrect message	
	la $a0,incorrect_2_msg
	syscall
	
	j try				# jump to next try
	
lose: li $v0,4 				# print lose message then exit
	la $a0,lose_msg
	syscall
	j exit
