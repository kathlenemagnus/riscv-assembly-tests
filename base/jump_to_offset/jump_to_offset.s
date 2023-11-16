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
jump:
    nop
    jal x0, jump

.section .data
    .fill 64, 4, 0xFFFFFFFF
