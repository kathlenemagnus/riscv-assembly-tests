# riscv-assembly-tests
Simple Framework for Compiling RISC-V Assembly Tests

## Build Directions

This repo is compatible with the [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain).
Compatibility with other RISC-V toolchains is not guaranteed.

Build directions:
```
mkdir release
cd release
cmake .. -DRISCV_TOOLCHAIN=<path to the install of RISCV toolsuite>
make
```
