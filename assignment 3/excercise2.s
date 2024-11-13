#-----------------------------------------------------------------
#COSC 211 Assignment 3 Question 2
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .data
input:
    .asciiz "Enter your number (base 10): "
output:
    .asciiz "The number in base 2 is: "
binary:
    .space 9
error_message:
    .asciiz "Error: Input must be between 0 and 255\n"
#-----------------------------------------------------------------
        .text

main:

    li $v0, 4
    la $a0, input
    syscall

    #Get input from user
    li $v0, 5
    syscall

    #Store input in $t0
    add $t0, $zero, $v0
    li $t1, 7 #Shift counter

loop:
    slt $t3, $t1, $zero #Set $t3 to 1 if $t1 < 0
    beq $t3, $zero, skip #If $t3 is 0, jump to skip
    j end #Jump to end
skip:
    srlv $t2, $t0, $t1 #Shift $t0 right by $t1 and store in $t2
    and $t2, 1 #Mask $t2 with 1
    li $v0, 1 #Print $t2
    move $a0, $t2 #Move $t2 to $a0
    syscall 
    sub $t1, $t1, 1 #Decrement $t1
    j loop #Jump to loop
end:
    li $v0, 10
    syscall
