#-----------------------------------------------------------------
#COSC 211 Assignment 4 Question 2
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .data
input:
    .asciiz "This program prints the first 100 prime numbers:\n"
space:
    .asciiz " "
line:
    .asciiz "\n"
#-----------------------------------------------------------------
    .text
    .globl main

main:

    #Print input message
    li $v0, 4
    la $a0, input
    syscall

    #Set $a1 to 2 and $s2 to 100 to set parameters for primeloop
    li $a1, 2
    li, $s2, 100

    #Set $t5 to 0 and $t2 to 6 for the skip loop
    li $t5, 0
    li $t2, 6

    #Set $s0 to 1 for the first iteration of primeloop
    li $s0, 1

    #Jump to primeloop
    jal primeloop

primeloop:


    li $t1, 2

divide:
        
    div $a1, $t1 #Divide $a1 by $t1
    mflo $t3 #Move quotient to $t3
    slt $v0, $t3, $t1 #Set $v0 to 1 if $t3 is less than $t1
    beq $v0, $s0, fdprime #If $v0 is 1, jump to fdprime
    mfhi $t4 #Move remainder to $t4
    beq $t4, 0, nprime #If $t4 is 0, jump to nprime
    addi $t1, $t1, 1 #Add 1 to $t1
    j divide #Jump to divide (Loops it)

fdprime:
    
    #Print prime number
    beq $s2, 0, exit
    sub $s2, $s2, 1

    li $v0, 1
    move $a0, $a1
    syscall
    
    #Print space
    li $v0, 4
    la $a0, space
    syscall

    #Skip loop
    addi $t5, $t5, 1
    beq $t5, $t2, skip

nprime:

    #Add 1 to $a1 to get next number
    addi $a1, $a1, 1
    j $ra

skip:

    li $v0, 4
    la $a0, line
    syscall

    li $t5, 0
    j nprime

exit:
    
    li $v0, 10
    syscall
