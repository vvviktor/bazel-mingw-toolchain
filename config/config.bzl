MINGW_PATH="C:/msys64/ucrt64"
GCC_VERSION="13.2.0"
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