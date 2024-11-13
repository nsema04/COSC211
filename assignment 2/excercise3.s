#-----------------------------------------------------------------
#COSC 211 Assignment 2 Question 3
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .data
input:
    .space 11
strmsg:
    .asciiz "Enter a 10 character string: "
thirdmsg:
    .asciiz "\nThe third character is: "
fifthmsg:
    .asciiz "\nThe fifth character is: "
seventhmsg:
    .asciiz "\nThe seventh character is: "
#-----------------------------------------------------------------
    .text       
    .globl main
main:
    #Load the String Message
    li $v0, 4
    la $a0, strmsg
    syscall
    
    #Load the input of 10 characters into input
    li $v0, 8
    la $a0, input
    li $a1, 11 
    syscall

    #Load the third character message
    li $v0, 4
    la $a0, thirdmsg
    syscall

    #Load the third character
    la $a0, input
    lb $t0, 2($a0)
    move $t1, $t0

    #Print the third character
    li $v0, 11
    move $a0, $t1
    syscall

    #Load the fifth character message   
    li $v0, 4
    la $a0, fifthmsg
    syscall

    #Load the fifth character
    la $a0, input
    lb $t0, 4($a0)
    move $t1, $t0

    #Print the fifth character
    li $v0, 11
    move $a0, $t1
    syscall

    #Load the seventh character messags
    li $v0, 4
    la $a0, seventhmsg
    syscall

    #Load the seventh character
    la $a0, input
    lb $t0, 6($a0)
    move $t1, $t0

    #Print the seventh character
    li $v0, 11
    move $a0, $t1
    syscall

    #Exit the program
    li $v0, 10
    syscall
    syscall

    #Load the seventh character messags
    li $v0, 4
    la $a0, seventhmsg
    syscall

    #Load the seventh character
    la $a0, input
    lb $t0, 7($a0)
    syscall

    #Print the seventh character
    li $v0, 11
    move $a0, $t1
    syscall

    #Exit the program
    li $v0, 10
    syscall


    