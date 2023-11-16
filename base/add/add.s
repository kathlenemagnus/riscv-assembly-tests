/* Test: add.elf
 * ISA: RV64I
 * Description: Stream of reg-reg add instructions.
 */

.section .text
    .global main

main:
    .rept 1000
        add x7, x6, x5
    .endr
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
