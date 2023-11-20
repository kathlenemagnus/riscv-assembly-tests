/* Test: csrrw.elf
 * ISA: rv64i_zicsr
 * Description: A single csrw instruction writing to MEPC
 */

.include "host.s"
.include "macros.s"

.section .text
    .global main

main:
    csrw	mepc,x5

pass:
    test_pass

fail:
    test_fail

.section .data
data:
    .fill 64, 4, 0xFFFFFFFF
