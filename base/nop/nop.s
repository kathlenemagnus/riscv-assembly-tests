/* Test: nop.elf
 * ISA: RV64I
 * Description: Stream of nops.
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    .rept 1000
        nop
    .endr

    test_pass

.section .data
    .fill 64, 4, 0xFFFFFFFF
