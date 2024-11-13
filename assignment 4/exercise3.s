#-----------------------------------------------------------------
#COSC 211 Assignment 4 Question 3
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
.data

prompt: 
    .asciiz "Enter the number of disks: "
openbrack:
    .asciiz "["
comma:
    .asciiz ", "
closebrack:
    .asciiz "]\n"
rod1:
    .space 4
rod2:
    .space 4
rod3:
    .space 4
#-----------------------------------------------------------------
.text
.globl main

main:

    #Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    #Get number of disks
    li $v0, 5
    syscall

    #Initialize rods
    move $a0, $v0
    la $a1, rod1
    sw $v0, ($a1)
    la $a2, rod3
    la $a3, rod2

    #Store items on stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)
    
    jal print 

    #Restore stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal hanoi

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    j exit

hanoi:

    #If n = 1, move disk from rod1 to rod3
    li $t0, 1
    beq $a0, $t0, eq

    #Make space on stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    #Move disk from rod1 to rod2
    addi $a0, $a0, -1
    la $t0, ($a2)
    move $a2, $a3
    move $a3, $t0
    
    #Recursively call hanoi
    jal hanoi

    #Restore stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    #Move disk from rod1 to rod3
    lw $t0, ($a1)
    addi $t0, $t0, -1
    sw $t0, ($a1)
    lw $t0, ($a2)
    addi $t0, $t0, 1
    sw $t0, ($a2)

    #Store items on stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    #Jump to print
    jal print

    #Restore stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    #Make space on stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    #Move disk from rod2 to rod3
    addi $a0, $a0, -1
    la $t0, ($a1)
    move $a1, $a3
    move $a3, $t0

    #Recursively call hanoi for a 2nd time
    jal hanoi

    #Restore stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    #Loop back to hanoi
    jr $ra

print: 

    #Print open bracket
    li $v0, 4
    la $a0, openbrack
    syscall

    #Print rod1
    li $v0, 1
    lw $a0, rod1
    syscall

    #Print comma
    li $v0, 4
    la $a0, comma
    syscall

    #Print rod2
    li $v0, 1
    lw $a0, rod2
    syscall

    #Print 2nd comma
    li $v0, 4
    la $a0, comma
    syscall

    #Print rod3
    li $v0, 1
    lw $a0, rod3
    syscall

    #Print close bracket
    li $v0, 4
    la $a0, closebrack
    syscall

    #Jump back to hanoi
    jr $ra

eq:

    #Move disk from rod1 to rod3
    lw $t1, ($a2)
    addi $t1, $t1, 1
    sw $t1, ($a2)
    lw $t1, ($a1)
    addi $t1, $t1, -1
    sw $t1, ($a1)

    #Store items on stack
    addi $sp, $sp, -20
    sw $ra, 0($sp)
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $a2, 12($sp)
    sw $a3, 16($sp)

    jal print

    #Restore stack
    lw $ra, 0($sp)
    lw $a0, 4($sp)
    lw $a1, 8($sp)
    lw $a2, 12($sp)
    lw $a3, 16($sp)
    addi $sp, $sp, 20

    jr $ra

exit:

    li $v0, 10
    syscall





    
    

    