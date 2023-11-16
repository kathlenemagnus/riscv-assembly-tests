/* Test: nop.elf
 * ISA: RV64I
 * Description: Stream of nops.
 */

.section .text
    .global main

main:
    .rept 1000
        nop
    .endr
pass:
    wfi
fail:
    nop
.section .data
    .fill 64, 4, 0xFFFFFFFF
