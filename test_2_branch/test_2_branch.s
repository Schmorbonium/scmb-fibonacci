# RISC-V 32E Assembly Program to Explicitly Test Branching Instructions

.data
msg_success:    .word 0
msg_failure:    .word 1

.text
.global _start

_start:
    # Initialize registers
    li  x1, 1      # Initialize a counter
    li  x2, 1     # Set the loop limit

    # BEQ Test
    beq x1, x2, beq_success
    j   beq_failure

beq_success:
    # Print success message for BEQ
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

beq_failure:
    # Print failure message for BEQ
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

next_test:
    # Increment counter and check if all tests are done
    addi x1, x1, 1
    addi x6, x0, 7
    bne x1, x6, test_loop  # Change 7 to the total number of tests

    # If all tests are done, exit the program
    li  x15, 10     # Exit system call
    ecall

test_loop:
    # BNE Test
    addi x3, x0, 15
    bne x1, x3, bne_success
    j   bne_failure

bne_success:
    # Print success message for BNE
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

bne_failure:
    # Print failure message for BNE
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

    # BLT (signed) Test
    li  x3, -5     # Set a negative number
    blt x3, x2, blt_signed_success
    j   blt_signed_failure

blt_signed_success:
    # Print success message for BLT (signed)
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

blt_signed_failure:
    # Print failure message for BLT (signed)
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

    # BLTU Test
    li  x4, 0xFFFFFFFF # Set a large positive unsigned number
    bltu x4, x2, bltu_success
    j   bltu_failure

bltu_success:
    # Print success message for BLTU
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

bltu_failure:
    # Print failure message for BLTU
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

    # BGE (signed) Test
    li  x5, 15     # Set a positive number
    bge x5, x2, bge_signed_success
    j   bge_signed_failure

bge_signed_success:
    # Print success message for BGE (signed)
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

bge_signed_failure:
    # Print failure message for BGE (signed)
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

    # BGEU Test
    li  x6, 20     # Set a positive unsigned number
    bgeu x6, x2, bgeu_success
    j   bgeu_failure

bgeu_success:
    # Print success message for BGEU
    la  x1, msg_success
    li  x15, 4      # Print string system call
    ecall
    j   next_test

bgeu_failure:
    # Print failure message for BGEU
    la  x1, msg_failure
    li  x15, 4      # Print string system call
    ecall
    j   end_program

end_program:
    # Exit program
    li  x15, 10     # Exit system call
    ecall
