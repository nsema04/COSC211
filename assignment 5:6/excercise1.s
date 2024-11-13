#-----------------------------------------------------------------
#COSC 211 Assignment 5/6 Question 1
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
.data

number1:
    .asciiz "Please enter the first number: "
number2:
    .asciiz "Please enter the second number: "
result:
    .asciiz "The product is: "


#-----------------------------------------------------------------

.globl main
.text

main:

    #Prompt user for first number
    li $v0, 4
    la $a0, number1
    syscall

    #Read first number
    li $v0, 5
    syscall

    #Store first number
    move $s0, $v0

    #Prompt user for second number
    li $v0, 4
    la $a0, number2
    syscall

    #Read second number
    li $v0, 5
    syscall

    #Store second number    
    move $s1, $v0

    #Need to check if first number is negative
    #If first number is negative, jump to neg. If second number is negative, jump to neg2
    bltz $s0, neg1
    bltz $s1, neg2
    j multiply

    neg1:

        #If second num is negative as well, jump to both
        bltz $s1, both
        li $t0, 1

        #Make first number positive
        sub $s0, $zero, $s0
        j multiply

    neg2:

        li $t0, 1

        #Make second number positive
        sub $s1, $zero, $s1
        j multiply

    both:

        li $t0, 2

        #Make both numbers positive
        sub $s0, $zero, $s0
        sub $s1, $zero, $s1
        j multiply

    multiply:

        beqz $s1, resultcalc
        andi $t1, $s1, 1
        beqz $t1, adds
        add $s2, $s2, $s0

    adds:

        sll $s0, $s0, 1
        srl $s1, $s1, 1
        j multiply

    resultcalc:

        #If first nunber is negative, jump to negresult
        beq $t0, 1, negresult
        j printresult

    negresult:

        sub $s2, $zero, $s2
        j printresult

    printresult:

        li $v0, 4
        la $a0, result
        syscall

        li $v0, 1
        move $a0, $s2
        syscall

        li $v0, 10
        syscall



