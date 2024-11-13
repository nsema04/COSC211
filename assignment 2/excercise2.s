#-----------------------------------------------------------------
#COSC 211 Assignment 2 Question 2
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .data
msg1:
    .asciiz "Enter number 1: "
msg2:
    .asciiz "Enter number 2: "
sum:
    .asciiz "The sum of the two numbers is: "
diff:
    .asciiz "\nThe difference of the two numbers is: "
#-----------------------------------------------------------------
    .text
    .globl main
main:
    #Loads message 1
    li $v0, 4
    la $a0, msg1
    syscall

    #Recieves input for number 1
    li $v0, 5
    syscall

    #Stores number 1 in $t0
    move $t0, $v0

    #Loads message 2
    li $v0, 4
    la $a0, msg2
    syscall

    #Recieves input for number 2
    li $v0, 5
    syscall

    #Stores number 2 in $t1
    move $t1, $v0

    #Adds the two numbers
    add $t2, $t0, $t1

    #Subtracts the two numbers     
    sub $t3, $t0, $t1

    #Loads sum message 
    li $v0, 4
    la $a0, sum
    syscall

    #Prints the sum
    li $v0, 1   
    move $a0, $t2
    syscall

    #Loads difference message
    li $v0, 4
    la $a0, diff
    syscall

    #Prints the difference
    li $v0, 1
    move $a0, $t3
    syscall

    #Exits the program
    li $v0, 10
    syscall
#-----------------------------------------------------------------
    