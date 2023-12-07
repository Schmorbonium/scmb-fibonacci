# RISC-V Assembly Program to Check Load and Store Variants

.data
    array:  .space  16      # Allocate 16 bytes of space for the array

.text
    la x1, array            # Load the base address of the array into x1

    # Store values to memory using different store instructions
    addi x2, x0, 42         # Load immediate value 42 to t1
    sb x2, 0(x1)            # Store byte (8 bits) to array[0]
    sh x2, 2(x1)            # Store halfword (16 bits) to array[2]
    sw x2, 4(x1)            # Store word (32 bits) to array[4]

    # Load values from memory using different load instructions
    lb x2, 0(x1)            # Load byte from array[0] to t2
    lh x3, 2(x1)            # Load halfword from array[2] to t3
    lw x4, 4(x1)            # Load word from array[4] to t4
    lhu x5, 8(x1)           # Load upper halfword from array[8] to t5
    lbu x6, 8(x1)           # Load upper byte from array[8] into x6

    # Check results
    # You can customize this part based on your specific checks or requirements
    # For simplicity, this example just uses registers to hold the values.
    # You may want to print or compare the values as needed.

    # Exit the program
    addi x7, x0, 10         # System call code for program exit
    ecall                   # Make the system call