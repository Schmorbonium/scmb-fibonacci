# RISC-V 32E Assembly Test with Immediate Variants

# Data section
.data
  array:  .space 16
  msg1:   .word 0
  msg2:   .word 1

# Text section
.text
  main:
    # Arithmetic instructions with immediate variants
    li x1, 2
    li x2, 3
    addi x3, x1, 5       # x3 = x1 + 5

    # Logical instructions with immediate variants
    li x5, 1
    li x6, 0
    andi x7, x5, 3       # x7 = x5 & 3
    ori  x8, x6, 5       # x8 = x6 | 5
    xori x9, x7, 7       # x9 = x7 ^ 7

    # SLT and SLTU instructions with immediate variants
    li x10, 5
    li x11, 3
    slti x12, x10, 8      # x12 = (x10 < 8)
    sltiu x13, x11, 2    # x13 = (x11 < 2) unsigned

    # Load and store instructions with immediate variants
    li x14, 42
    sw x14, array        # Store x14 in array
    lw x15, array        # Load from array to x15

    # Shift instructions with immediate variants
    li x5, 8
    slli x6, x5, 2     # x6 = x5 << 2 (shift left logical immediate)
    srli x7, x6, 1     # x7 = x6 >> 1 (shift right logical immediate)
    srai x8, x6, 1     # x8 = x6 >> 1 (shift right arithmetic immediate)

    # Branch instructions
    bne x14, x15, fail   # Branch if not equal
    bnez x12, fail       # Branch if x10 < 8 is true
    bnez x8, fail       # Branch if x6 >> 1 is not zero
    j success            # Jump to success label

fail:
    j fail_exit

success:
    li x1, 0
    j success_exit

fail_exit:
    # Print failure message
    li x1, 1
    li x2, msg2
    li x3, 13   # Length of the string
    li x8, 64   # Write syscall number
    ecall

    # Exit program
    li x8, 93   # Exit syscall number
    li x1, 1
    ecall

success_exit:
    # Print success message
    li x1, 1
    li x2, msg1
    li x3, 14   # Length of the string
    li x8, 64   # Write syscall number
    ecall

    # Exit program
    li x8, 93   # Exit syscall number
    li x1, 0
    ecall
