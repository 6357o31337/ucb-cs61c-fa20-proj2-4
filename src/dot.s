.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 75.
# - If the stride of either vector is less than 1,
#   this function terminates the program with error code 76.
# =======================================================
dot:

    ebreak

    # Prologue
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)

    mv s0, a1
    mv s1, a3
    
    mv t0 zero
    
    mv t4 zero
    mv t6, a4

    # li t5 4
    mv t5 zero
    addi t5, t5, 4

    mul s1, s1, t5
    mul t6, t6, t5


loop_start:
    # we are done once t0 >= a2
    bge t0, a2, loop_end
    
    # t1 := *a0
    lw t1, 0(a0)
    lw t2, 0(s0)
    
    #
    mul t3, t1, t2

    add t4, t4, t3
    
    # go to next value
    addi t0, t0, 1
    add a0, a0, s1
    add s0, s0, t6
    j loop_start




loop_end:
    mv a0, t4

    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8
    
    ret