# RISC-V 32E Assembly Program to Explicitly Test Branching Instructions

.data
msg_success:    .asciiz "Branching instructions test passed!\n"
msg_failure:    .asciiz "Branching instructions test failed!\n"

.text
.global _start

_start:
    # Initialize registers
    li  a0, 1      # Initialize a counter
    li  a1, 10     # Set the loop limit

    # BEQ Test
    beq a0, a1, beq_success
    j   beq_failure

beq_success:
    # Print success message for BEQ
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

beq_failure:
    # Print failure message for BEQ
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

next_test:
    # Increment counter and check if all tests are done
    addi a0, a0, 1
    bne a0, 7, test_loop  # Change 7 to the total number of tests

    # If all tests are done, exit the program
    li  a7, 10     # Exit system call
    ecall

test_loop:
    # BNE Test
    bne a0, a1, bne_success
    j   bne_failure

bne_success:
    # Print success message for BNE
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

bne_failure:
    # Print failure message for BNE
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # BLT (signed) Test
    li  a2, -5     # Set a negative number
    blt a2, a1, blt_signed_success
    j   blt_signed_failure

blt_signed_success:
    # Print success message for BLT (signed)
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

blt_signed_failure:
    # Print failure message for BLT (signed)
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # BLTU Test
    li  a3, 0xFFFFFFFF # Set a large positive unsigned number
    bltu a3, a1, bltu_success
    j   bltu_failure

bltu_success:
    # Print success message for BLTU
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

bltu_failure:
    # Print failure message for BLTU
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # BGE (signed) Test
    li  a4, 15     # Set a positive number
    bge a4, a1, bge_signed_success
    j   bge_signed_failure

bge_signed_success:
    # Print success message for BGE (signed)
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

bge_signed_failure:
    # Print failure message for BGE (signed)
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # BGEU Test
    li  a5, 20     # Set a positive unsigned number
    bgeu a5, a1, bgeu_success
    j   bgeu_failure

bgeu_success:
    # Print success message for BGEU
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   next_test

bgeu_failure:
    # Print failure message for BGEU
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

end_program:
    # Exit program
    li  a7, 10     # Exit system call
    ecall
