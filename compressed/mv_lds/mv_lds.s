/* Test: mv_lds.elf
 * ISA: RV64c
 * Description: Stream of compressed and regular mv instructions.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 500
        c.mv x10,x5
        mv   x5, x10
    .endr

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
