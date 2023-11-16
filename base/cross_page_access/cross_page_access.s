/* Test: cross_page_access.elf
 * ISA: RV64I 
 * Description: Test cross page instruction access
 */

.section .text
    .global main

main:
set_mtvec:
    la t0, m_mode_handler
    csrw mtvec, t0

set_satp:
    la t0, satp_table ## PA addr
    srl t0, t0, 12
    li t1, 0x8000000000000000 #Sv39
    or t1, t1, t0
    csrw satp, t1

set_mpp:
    jal func_set_mpp

## map
## VA: 0x1_0000_0000 to PA: 0x2000
    li a0, 0x100000000
    csrw mepc, a0
    li a0, 4
    mret

    j pass


func_set_mpp:
    ## MPP = 1, go to supervisor mode
    li t0, (0x3<<11)
    csrc mstatus, t0
    li t0, (0x1<<11)
    csrs mstatus, t0
    jr ra

.equ CAUSE_CODE_ILLEGAL_INST, 0x2
.equ CAUSE_CODE_HS_ECALL    , 0x9
.equ CAUSE_CODE_M_ECALL     , 0xb

.align 6
m_mode_handler:
    csrr t0, mcause

    li s0, CAUSE_CODE_HS_ECALL
    beq t0, s0, hs_ecall

    j fail

hs_ecall:
    j pass


pass:
    add s0, s0, s0
    wfi
fail:
    add s1, s1, s1
    wfi

.text
.align 13
## 0x2000
.option norvc
s_page0:
## The fence.i with trigger the special case
## if fence.i is replaced to a nop
## test will always pass whether the assertion is removed or not 
    fence.i
loop:
    add a0, a0, -1
    j target
.= (s_page0 + 4096 -2)
target:
    sub t0, t0, t1
    bne a0, zero, loop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    ecall

.option rvc

.align 13
## 0x4000
s_page2:
    add t0, t0, t1
.align 12
s_page3:
.align 12
s_page4:
.align 12
s_page5:

.equ PTE_NODE, 0x0
.equ PTE_X   , 0x8
.equ PTE_W   , 0x4
.equ PTE_R   , 0x2
.equ PTE_WR  , PTE_W|PTE_R
.equ PTE_XR  , PTE_X|PTE_R
.equ PTE_XWR , PTE_X|PTE_W|PTE_R
.equ PTE_DAV , 0xc1
.equ PTE_U   , 0x10

.section .data
.align 15
## 0x8000
empty_table:
    .dword 0x0

.align 12
satp_table:
## 0x9000
    .dword 0x0
    .dword 0x0
    .dword 0x0
    .dword 0x0
    .dword (0xa000>>2)|PTE_DAV|PTE_NODE
    .dword 0x0
    .dword 0x0
    .dword 0x0

.align 12
## 0xa000
satp_table1:
    .dword (0xb000>>2)|PTE_DAV|PTE_NODE

.align 12
## 0xb000
satp_table2:
    .dword (0x2000>>2)|PTE_DAV|PTE_XWR
    .dword (0x3000>>2)|PTE_DAV|PTE_XWR
    .dword (0x4000>>2)|PTE_DAV|PTE_XWR
