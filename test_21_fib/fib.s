
_start:
    li x2, 1
    li x3, 1
loop:
    add x3, x3, x2
    add x2, x3, x2
    jal loop
