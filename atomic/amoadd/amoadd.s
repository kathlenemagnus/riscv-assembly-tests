/* Test: amoadd.elf
 * ISA: rv64i
 * Description: Stream of reg-reg amoadd instructions.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 1000
        amoadd.d x5, x6, 0(x7)
    .endr

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
