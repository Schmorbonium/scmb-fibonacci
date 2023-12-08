# RISC-V 32E Assembly Test with SLT, SLTU, and Shift Instructions

# Data section
.data
  array:  .space 16
  msg1:   .word 0
  msg2:   .word 1

# Text section
.text
  main:
    # Arithmetic instructions
    li x1, 2
    li x2, 3
    add x3, x1, x2      # x3 = x1 + x2
    sub x4, x3, x2      # x4 = x3 - x2

    # Logical instructions
    li x5, 1
    li x6, 0
    and x7, x5, x6      # x7 = x5 & x6
    or  x8, x7, x5     # x8 = x7 | x5
    xor x9, x8, x6    # x9 = x8 ^ x6

    # SLT and SLTU instructions
    li x10, 5
    li x11, 3
    slt x12, x10, x11   # x12 = (x10 < x11)
    sltu x13, x10, x11  # x13 = (x10 < x11) unsigned

    # Load and store instructions
    li x1, 42
    sw x1, array         # Store x1 in array
    lw x14, array        # Load from array to x14

    # Shift instructions
    li x7, 8
    sll x8, x7, 2     # x8 = x7 << 2 (shift left logical)
    srl x9, x8, 1     # x9 = x8 >> 1 (shift right logical)
    sra x10, x8, 1     # x10 = x8 >> 1 (shift right arithmetic)

    # Branch instructions
    bne x1, x14, fail    # Branch if not equal
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
    li x5, 64   # Write syscall number
    ecall

    # Exit program
    li x5, 93   # Exit syscall number
    li x1, 1
    ecall

success_exit:
    # Print success message
    li x1, 1
    li x2, msg1
    li x3, 14   # Length of the string
    li x5, 64   # Write syscall number
    ecall

    # Exit program
    li x5, 93   # Exit syscall number
    li x1, 0
    ecall
