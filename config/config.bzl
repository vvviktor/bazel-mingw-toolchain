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

LINK_FLAGS=[
    "-lkernel32",
    "-luser32",
    "-lgdi32",
    "-lwinspool",
    "-lshell32",
    "-lole32",
    "-loleaut32",
    "-luuid",
    "-lcomdlg32",
    "-ladvapi32",
]

OPT_LINK_FLAGS=[
    "-Wl,--gc-sections",
]