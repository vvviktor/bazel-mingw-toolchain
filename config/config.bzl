COMPILE_FLAGS=[
    "-Wextra",
    "-Wall",
]

DEBUG_COMPILE_FLAGS=[
    "-g",
    "-Og",
]

OPT_COMPILE_FLAGS=[
    "-g0",
    "-O3",
    "-DNDEBUG",
    "-ffunction-sections",
    "-fdata-sections",
]

OPT_LINK_FLAGS=[
    "-Wl,--gc-sections",
]