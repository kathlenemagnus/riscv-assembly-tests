# riscv-assembly-tests
-Simple Framework for Compiling RISC-V Assembly Tests

## Build Directions

You will need an installation of the RISC-V tools available, specifically
`riscv64-unknown-elf-as` and `riscv64-unknown-elf-ld`.

Build directions:
```
mkdir release
cd release
cmake .. -DRISCV_TOOLCHAIN=<path to the install of RISCV toolsuite>
make
```
