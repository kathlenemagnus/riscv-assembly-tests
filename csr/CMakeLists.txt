project (BASE_TESTS)

set (CMAKE_ASM_FLAGS "-march=rv64i_zicsr")

add_subdirectory (csrrw)
