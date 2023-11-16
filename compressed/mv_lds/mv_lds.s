/* Test: mv_lds.elf
 * ISA: RV64c
 * Description: Stream of compressed move operations followed by a non-compress load
	Tests the decode cache
 */

.section .text
    .global main

main:
    .rept 4095
        c.mv x10,x5
    .endr
    ld      sp,24(gp)
    fence.i
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
