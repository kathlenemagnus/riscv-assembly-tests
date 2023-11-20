/* Test: cmv.elf
 * ISA: RV64c
 * Description: Stream of compressed move operations
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 1000
        c.mv x10,x5
    .endr

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
