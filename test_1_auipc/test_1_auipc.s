# Test Example: Using auipc with GCC-style syntax

# Data Section
.data
    global_data: .word 42  # Some global data

# Text Section
.text
    # Main program
    auipc t0, %pcrel_hi(global_data)  # Load upper 20 bits of global_data's address into t0

    lw t1, %pcrel_lo(global_data)(t0)  # Load lower 12 bits of global_data's address into t1

    add t1, t1, t1


   