/* Test: add.elf
 * ISA: RV64I
 * Description: Stream of reg-reg add instructions.
 */

.section .text
    .global main

main:
    addi x28, x0, 10
    addi x7, x0, 1
loop:
    .rept 100
        add x5, x5, x7
    .endr
    addi x28, x28, -1
    bne x28, zero, loop
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
