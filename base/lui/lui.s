/* Test: add.elf
 * ISA: RV64I
 * Description: Stream of reg-reg load upper immediate instruction
 *.
 */

.section .text
    .global main

main:
    .rept 200
        lui x5, 0xFFFFF
        lui x5, 0x00001
        lui x5, 0x7FFFF
        lui x5, 0x00000
        lui x5, 0xF0000
    .endr
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
