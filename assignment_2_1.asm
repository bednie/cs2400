.data 
str_rect: .asciiz 		"The area of this rectangle is: \n"
str_tri: .asciiz 		"\nThe area of the right triangle is: \n"
input_length: .asciiz 		"Enter an integer for length: \n"
input_width: .asciiz 		"Enter an integer for width: \n"
two: .float 2 			# area of right triangle is (b*h)/2, thus the 2

.text
# get user input for length
li $v0,4
la $a0,input_length
syscall

li $v0,5
syscall
move $s0,$v0 # store in $s0

# get user input for width
li $v0,4
la $a0,input_width
syscall

li $v0,5
syscall
move $s1,$v0 # store in $s1

# calculate area
mul $s2,$s0,$s1 

# print area of rectangle
li $v0,4
la $a0,str_rect
syscall

li $v0,1
move $a0,$s2
syscall

# calculate area of the triangle
mtc1 $s2,$f1			# move area result from $s2 to floating point coproc
cvt.s.w $f1,$f1			# convert to floating point
lwc1 $f2,two			# load two
div.s $f0,$f1,$f2		# divide reactangle area result by 2

# print area of the triangle
li $v0,4
la $a0,str_tri
syscall

li $v0,2
mov.s $f12,$f0
syscall 

# exit
li $v0,10 
syscall