/* Test: fence.elf
 * ISA: RV64I
 * Description: Modify jal then execute it again to test decode block cache.
   Replace first jal with a nop so test can jump to pass. The fence.i will
   flush the decode block cache.
 */

.section .text
    .global main

main:
    add     t3,zero,zero  # counter for fence.i
    addi    t1,zero,16    # nop address
    addi    t2,zero,12    # jal address

test_jal:
    jal     t4,modify_jal # modified to nop
    nop
    jal     t4,pass

modify_jal:
    lwu     t0,0(t1)      # get nop opcode value
    sw      t0,0(t2)      # write nop to jal address
    fence.i
    bne     t3,zero,fail  # if counter > 1 then we failed to modify the jal
    addi    t3,t3,1       # increment fence.i counter
    jal     t4,test_jal

pass:
    wfi

fail:
    wfi

write_tohost:
    nop
