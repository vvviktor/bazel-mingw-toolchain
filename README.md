# MINGW toolchain for bazel projects in Windows

Add following strings to your `MODULE.bazel` file:
```
bazel_dep(
    name = "env"
)

git_override(
    module_name = "env",
    remote = "https://github.com/vvviktor/bazel-mingw-toolchain.git",
    commit = "522e8c257bb5559e55ef34d2a6b5686554f6e398",
)

register_execution_platforms(
    "@env//platform:windows_platform"
)

register_toolchains(
    "@env//toolchain:mingw_cc_toolchain",
)
```

Add following commands to your `.bazelrc` file:
```
build --incompatible_enable_cc_toolchain_resolution             # allow bazel to use custom toolchains
build --define=MINGW_PATH="path/to/mingw"                       # define path to yuor mingw location, for example: build --define=MINGW_PATH="C:/msys64/ucrt64" 
build --define=GCC_VERSION="gcc version"                        # define gcc version used, for example: build --define=GCC_VERSION="13.2.0"
```
---
Toolchain allows usage of `--compilation_mode dbg|opt` build option. 

Default flags defined in `config/config.bzl`:
- for all actions: `-Wextra -Wall`
- for `--compilation_mode dbg`: `-g -Og` + linker flags `-W1l,--gc-sections`
- for `--compilation_mode opt`: `-g0 -O3 -DNDEBUG -ffunction-selections -fdata-selections`