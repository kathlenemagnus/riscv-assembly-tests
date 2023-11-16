/* Test: amoadd.elf
 * ISA: RV64I
 * Description: Stream of reg-reg amoadd instructions.
 */

.section .text
    .global main

main:
    .rept 1000
        amoadd.d x5, x6, 0(x7)
    .endr
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
