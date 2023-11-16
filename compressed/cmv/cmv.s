/* Test: cmv.elf
 * ISA: RV64c
 * Description: Stream of compressed move operations
 */

.section .text
    .global main

main:
    .rept 10
        c.mv x10,x5
    .endr
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
