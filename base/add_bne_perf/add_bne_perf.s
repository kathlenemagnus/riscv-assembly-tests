/* Test: add_bne_perf
 * ISA: RV64I
 * Description: Runs 10 add instructions up to 100M+ times as a performance test
 */

.section .text
    .global main

main:
    /* ~(100M * 10) insts  */
    /* lui  x28, 0x5f5e1
       slli x28, x28, 4  */

    /* ~(1M * 10) insts
       lui  x28, 0xf424
       srli x28, x28, 8 */

    /* ~(10M * 10) insts */
    lui  x28, 0x927c
    srli x28, x28, 4

loop:
    .rept 10
        add x5, x6, x7
    .endr
    addi x28, x28, -1
    bne x28, zero, loop
    wfi

.section .data
    .fill 64, 4, 0xFFFFFFFF
