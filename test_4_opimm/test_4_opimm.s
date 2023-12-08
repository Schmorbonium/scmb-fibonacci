# RISC-V 32E Assembly Test with Immediate Variants

# Data section
.data
  array:  .space 16
  msg1:   .asciiz "Test passed!\n"
  msg2:   .asciiz "Test failed!\n"

# Text section
.text
  main:
    # Arithmetic instructions with immediate variants
    li a0, 2
    li a1, 3
    addi a2, a0, 5       # a2 = a0 + 5

    # Logical instructions with immediate variants
    li a4, 1
    li a5, 0
    andi a6, a4, 3       # a6 = a4 & 3
    ori  a7, a5, 5       # a7 = a5 | 5
    xori a8, a6, 7       # a8 = a6 ^ 7

    # SLT and SLTU instructions with immediate variants
    li a9, 5
    li a10, 3
    slti a11, a9, 8      # a11 = (a9 < 8)
    sltiu a12, a10, 2    # a12 = (a10 < 2) unsigned

    # Load and store instructions with immediate variants
    li a13, 42
    sw a13, array        # Store a13 in array
    lw a14, array        # Load from array to a14

    # Shift instructions with immediate variants
    li a15, 8
    slli a16, a15, 2     # a16 = a15 << 2 (shift left logical immediate)
    srli a17, a16, 1     # a17 = a16 >> 1 (shift right logical immediate)
    srai a18, a16, 1     # a18 = a16 >> 1 (shift right arithmetic immediate)

    # Branch instructions
    bne a13, a14, fail   # Branch if not equal
    bnez a11, fail       # Branch if a9 < 8 is true
    bnez a18, fail       # Branch if a16 >> 1 is not zero
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
