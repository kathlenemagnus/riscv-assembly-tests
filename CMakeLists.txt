cmake_minimum_required(VERSION 3.15)

project (riscv_assembly_tests ASM)

# Unset these variables to prevent include of Mac SDK
set (CMAKE_OSX_SYSROOT "/")
set (CMAKE_OSX_DEPLOYMENT_TARGET "")

if (NOT RISCV_TOOLCHAIN)
  if(EXISTS /usr/bin/riscv64-linux-gnu-as)
    # There is a package on Ubuntu 20 for RISC-V
    set (CMAKE_ASM_COMPILER riscv64-linux-gnu-as)
    set (CMAKE_LINKER       riscv64-linux-gnu-ld)
    set (CMAKE_C_COMPILER   riscv64-linux-gnu-gcc)
  else()
    message(FATAL_ERROR "You must supply a -DRISCV_TOOLCHAIN=/path")
  endif()
else()
  message("-- Using RISCV_TOOLCHAIN: ${RISCV_TOOLCHAIN}")
  if(EXISTS ${RISCV_TOOLCHAIN}/bin/riscv64-unknown-elf-as)
    set (CMAKE_ASM_COMPILER "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-elf-as")
    set (CMAKE_C_COMPILER   "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-elf-clang")
    set (CMAKE_LINKER       "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-elf-ld")
  elseif(EXISTS ${RISCV_TOOLCHAIN}//bin/riscv64-unknown-linux-gnu-as)
    set (ADD_LINUX_TEST 1)
    set (CMAKE_ASM_COMPILER "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-linux-gnu-as")
    set (CMAKE_C_COMPILER   "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-linux-gnu-clang")
    set (CMAKE_LINKER       "${RISCV_TOOLCHAIN}/bin/riscv64-unknown-linux-gnu-ld")
  else()
    message(FATAL_ERROR "Cannot find tools in the given RISCV_TOOLCHAIN")
  endif()
endif()

set (BASE_DIR ${PROJECT_SOURCE_DIR})

set (LINKER_SCRIPT ${BASE_DIR}/common/main.ld)
set (CMAKE_C_FLAGS -static)
set (CMAKE_EXE_LINKER_FLAGS "")
set (CMAKE_ASM_LINKER_FLAGS "-T ${LINKER_SCRIPT} -e main")
set (CMAKE_ASM_LINK_EXECUTABLE "${CMAKE_LINKER} ${CMAKE_ASM_LINKER_FLAGS} <OBJECTS> -o <TARGET>")

# Directed Tests for base ISA
add_subdirectory (base)
# Atomic Extension
add_subdirectory (atomic)
# Float Extensions (F+D)
add_subdirectory (float)
# CSR
add_subdirectory (csr)
# Compressed
add_subdirectory (compressed)
