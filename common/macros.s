/* Test: nop.elf
 * ISA: rv64i
 * Description: Stream of nops.
 */

.macro test_pass
    li x1, 1
    la x2, tohost
    sw x1, 0(x2)
.endm

.macro test_fail
    li x1, 2
    la x2, tohost
    sw x1, 0(x2)
.endm
