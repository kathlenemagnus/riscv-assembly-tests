/* Test: csrrw.elf
 * ISA: RV64I
 * Description: A single csrw instruction writing to MEPC
 */

.section .text
    .global main

main:
    csrw	mepc,x5
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
