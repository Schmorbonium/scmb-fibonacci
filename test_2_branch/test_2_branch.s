# RISC-V 32E Assembly Program to Test Branching Instructions

.data
msg_success:    .asciiz "Branching instructions test passed!\n"
msg_failure:    .asciiz "Branching instructions test failed!\n"

.text
.global _start

_start:
    # Initialize registers
    li  a0, 1      # Initialize a counter
    li  a1, 10     # Set the loop limit

branching_test_loop:
    # Test BEQ
    beq a0, a1, beq_success
    j   beq_failure

beq_success:
    # Print success message for BEQ
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   end_program

beq_failure:
    # Print failure message for BEQ
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # Similar blocks for other branching instructions
    # Test BNE
    bne a0, a1, bne_success
    j   bne_failure

bne_success:
    # Print success message for BNE
    la  a0, msg_success
    li  a7, 4      # Print string system call
    ecall
    j   end_program

bne_failure:
    # Print failure message for BNE
    la  a0, msg_failure
    li  a7, 4      # Print string system call
    ecall
    j   end_program

    # Repeat similar blocks for other branching instructions (BLT, BGE, BLTU, BGEU)

end_program:
    # Exit program
    li  a7, 10     # Exit system call
    ecall
