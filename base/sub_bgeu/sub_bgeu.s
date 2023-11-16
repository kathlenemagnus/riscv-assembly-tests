/* Test: add.elf
 * ISA: RV64I
 * Description: Stream of reg-reg add instructions.
 */

.section .text
    .global main

main:
    addi x28, x0, 10
    addi x29, x0, 1
loop:
    .rept 100
        add x5, x6, x7
    .endr
    addi x29, x29, 1
    bgeu x28, x29, loop
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
