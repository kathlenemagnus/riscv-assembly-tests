project (BASE_TESTS)

set (CMAKE_ASM_FLAGS "-march=rv64imac_zifencei")

add_subdirectory (cmv)
add_subdirectory (mv_lds)
