.data
str: .asciiz "Enter an integer: \n"
str_2: .asciiz "Enter another integer: \n"
x_equals: .asciiz "x is: \n"

.text
# get user input for int "i" ($s1) 
li $v0,4
la $a0,str
syscall

li $v0,5
syscall
move $s1,$v0 # store in $s1

# get user input for int "j" ($s2)
li $v0,4
la $a0,str_2
syscall

li $v0,5
syscall
move $s2,$v0 # store in $s2

li $s0,0 # set "x" ($s0) equal to 0

# if-else logic
beq $s1,$s2,equal # compare "i" and "j"

li $s0,1 # set "x" ($s0) = 1
j next # jump to next instruction outside if-else block

equal: li $s0,2 # "x" ($s0) = 2

next: add $s0,$s0,1

# print output
li $v0,4
la $a0,x_equals
syscall

li $v0,1
move $a0,$s0
syscall

# exit
li $v0,10 
syscall
