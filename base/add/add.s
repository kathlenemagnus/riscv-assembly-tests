/* Test: add.elf
 * ISA: rv64i
 * Description: Stream of reg-reg add instructions.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 1000
        add x7, x6, x5
    .endr

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
