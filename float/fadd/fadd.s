/* Test: fadd.elf
 * ISA: rv64if_zicsr
 * Description: Stream of fadd instructions.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    # Turn on FP unit
    li a0, 0x2000
    csrw mstatus, a0
    .rept 1000
        fadd.d f5, f6, f7
    .endr

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
