OUTPUT_ARCH("riscv")

SECTIONS
{
  . = 0x0;
  .text : { *(.text) }
  . = ALIGN(0x8000);
  .data : { *(.data) }
  . = ALIGN(0x1000);
  .bss  : { *(.bss) }
}
