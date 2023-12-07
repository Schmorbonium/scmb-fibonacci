# Test the 8 instructions that interact with memory
.data
    array: .word  10, 20, 30, 40, 50

.text
    la x5, array

    lw x1, 0(x5)
    lw x2, 4(x5)

    add x3, x1, x2
    sw x3, 8(x5)

    lw x4, 8(x5)

    # infinite loop

