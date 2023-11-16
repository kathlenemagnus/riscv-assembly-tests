/* Test: fadd.elf
 * ISA: RV64IF
 * Description: Stream of fadd instructions.
 */

.section .text
    .global main

main:
    # Turn on FP unit
    li a0, 0x2000
    csrw mstatus, a0
    .rept 1000
        fadd.d f5, f6, f7
    .endr
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
