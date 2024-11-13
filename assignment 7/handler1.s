#-----------------------------------------------------------------
#COSC 211 Assignment 7 Question 1
#Noah Semashkewich
#ID 53882783
#-----------------------------------------------------------------
    .kdata

exception_msg:
    .asciiz "Exception occured at PC = \n"
arithmetic_msg:
    .asciiz "Arithmetic overflow\n"
unaligned_msg:
    .asciiz "Unaligned address in store: \n"
breakpoint_msg:
    .asciiz "Breakpoint exception\n"
header_msg:
    .asciiz "--- exception loop ---\n"
save0:
    .word 0

#-----------------------------------------------------------------

    .ktext 80000180

    .set noat
    sw $at, save0

    #Use $k0 and $k1 to hold the exception cause and EPC
    mfc0 $k0, $13
    mfc0 $k1, $14
    
    #Use a mask to determine exception cause
    andi $at $k0 0x7C
    srl $at $at 2

    #Branch to appropriate exception handler
    beq $at, 12, overflow
    beq $at, 9, breakn
    beq $at, 5, bAddr
    beq $at, 4, bAddr
    j done

overflow:
    #Print exception text
    li $v0, 4
    la $a0, exception_msg
    syscall

    #Print PC
    li $v0, 1
    move $a0, $k1
    syscall

    #Print arithmetic exception text
    li $v0, 4
    la $a0, arithmetic_msg
    syscall

    j done

breakn:

    #Print exception text
    li $v0, 4
    la $a0, exception_msg
    syscall

    #Print PC
    li $v0, 1
    move $a0, $k1
    syscall

    #Print breakpoint exception text
    li $v0, 4
    la $a0, breakpoint_msg
    syscall

    j done

bAddr:

    #Print exception text
    li $v0, 4
    la $a0, exception_msg
    syscall

    #Print PC
    li $v0, 1
    move $a0, $k1
    syscall

    #Print unaligned address exception text
    li $v0, 4
    la $a0, unaligned_msg
    syscall

    j done

done:

    #NOP instruction stored at EPC
    li $k0, 0x0
    sw $k0, 0($k1)

    #If exception, increment EPC by 4
    mfc0 $k0, $14
    addiu $k0, $k0, 4

    #Updating EPC and clearing cause registes
    mtc0 $k0, $14
    mtc0 $0, $13

    mfc0 $k0, $12
    andi $k0, 0xfffd
    ori $k0, 0x1
    mtc0 $k0, $12
    lw $at, save0
    eret

    .text
    .globl __start

__start:

    jal main
    li $v0, 10
    syscall