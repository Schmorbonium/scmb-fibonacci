# RISC-V 32E Assembly Test with SLT, SLTU, and Shift Instructions

# Data section
.data
  array:  .space 16
  msg1:   .asciiz "Test passed!\n"
  msg2:   .asciiz "Test failed!\n"

# Text section
.text
  main:
    # Arithmetic instructions
    li a0, 2
    li a1, 3
    add a2, a0, a1      # a2 = a0 + a1
    sub a3, a2, a1      # a3 = a2 - a1

    # Logical instructions
    li a7, 1
    li a8, 0
    and a9, a7, a8      # a9 = a7 & a8
    or  a10, a9, a7     # a10 = a9 | a7
    xor a11, a10, a8    # a11 = a10 ^ a8

    # SLT and SLTU instructions
    li a12, 5
    li a13, 3
    slt a14, a12, a13   # a14 = (a12 < a13)
    sltu a15, a12, a13  # a15 = (a12 < a13) unsigned

    # Load and store instructions
    li a0, 42
    sw a0, array         # Store a0 in array
    lw a16, array        # Load from array to a16

    # Shift instructions
    li a17, 8
    sll a18, a17, 2     # a18 = a17 << 2 (shift left logical)
    srl a19, a18, 1     # a19 = a18 >> 1 (shift right logical)
    sra a20, a18, 1     # a20 = a18 >> 1 (shift right arithmetic)

    # Branch instructions
    bne a0, a16, fail    # Branch if not equal
    j success            # Jump to success label

fail:
    j fail_exit

success:
    li a0, 0
    j success_exit

fail_exit:
    # Print failure message
    li a0, 1
    li a1, msg2
    li a2, 13   # Length of the string
    li a7, 64   # Write syscall number
    ecall

    # Exit program
    li a7, 93   # Exit syscall number
    li a0, 1
    ecall

success_exit:
    # Print success message
    li a0, 1
    li a1, msg1
    li a2, 14   # Length of the string
    li a7, 64   # Write syscall number
    ecall

    # Exit program
    li a7, 93   # Exit syscall number
    li a0, 0
    ecall
