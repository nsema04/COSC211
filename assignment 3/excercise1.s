#-----------------------------------------------------------------
#COSC 211 Assignment 3 Question 1
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .data
input: 
    .space 9
prompt: 
    .asciiz "Enter your number (1 or 0): "
result10: 
    .asciiz "\nThe number in base 10 is: "
result16: 
    .asciiz "\nThe number in base 16 is: 0x" 
#-----------------------------------------------------------------
    .text

main:
/Users/noahsemashkewich/Projects Year 1:2/COSC 211 Labs/COSC211Lab3/excercise1.s
    #Promt the user for input
    la $a0, prompt
    li $v0, 4
    syscall

    #Read the input string from the user and store in input
    la $a0, input
    #Read 9 characters, 1 for null terminator
    li $a1, 9
    li $v0, 8
    syscall

    #Load the address of input into $t0
    la $t0, input

    #Load multiplier into $t1
    li $t1, 7

    #Load register to store the total
    li $t9, 0

loop:
    lb $t2, ($t0)
    beqz $t2, end
    
    #Converting ASCII to integer
    sub $t2, $t2, 48
   
    #Multiply by 2^t1
    sll $t3, $t2, $t1
    
    #Add to total
    addu $t9, $t9, $t3
   
    #Decrement the multiplier
    sub $t1, $t1, 1
    
    #Increment the pointer
    add $t0, $t0, 1
    
    #Jump back to the top of the loop
    j loop

end:

    #Print base 16 string
    la $a0, result16
    li $v0, 4
    syscall

    #Convert to base 16
    move $t8, $t9
    divu $t6, $t8, 16
    remu $t7, $t8, 16

    #Check if first digit is 0
    slt $t8, $t6, 10
    beq $t8, 1, add48first
    
    #If not, add 55 for A-F 
    add $t6, $t6, 55
    b secondDigit

add48first:
    
    #If so, add 48 for 0-9
    add $t6, $t6, 48

secondDigit:
    
    #Check if second digit is 0
    slt $t8, $t7, 10
    beq $t8, 1, add48second
    add $t7, $t7, 55
    b printHex

add48second:
    
    #If so, add 48 for 0-9
    add $t7, $t7, 48

printHex:

    # Print hex values as characters using syscall 11
    move $a0, $t6
    li $v0, 11
    syscall

    move $a0, $t7
    syscall

    #Print base 10 string
    la $a0, result10
    li $v0, 4
    syscall

    #Print base 10 value
    move $a0, $t9
    li $v0, 1
    syscall

    #Exit program
    li $v0, 10
    syscall

