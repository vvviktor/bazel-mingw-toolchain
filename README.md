# MINGW toolchain for bazel projects in Windows


- If You desire to keep `bzlmod enabled`, add following strings to your `MODULE.bazel` file:

```starlark
bazel_dep(
    name = "mingw_toolchain"
)

git_override(
    module_name = "mingw_toolchain",
    remote = "https://github.com/vvviktor/bazel-mingw-toolchain.git",
    commit = "0ea42a31c45f0ff146058cecd124053b6915205e",
)
```
Add following commands to your `.bazelrc` file:
```starlark
build --incompatible_enable_cc_toolchain_resolution             # allow bazel to use custom toolchains
build --define=MINGW_PATH="path/to/mingw"                       # define path to yuor mingw location, for example: build --define=MINGW_PATH="C:/msys64/ucrt64" 
build --define=GCC_VERSION="gcc version"                        # define gcc version used, for example: build --define=GCC_VERSION="13.2.0"
```


---
- If You wish to disable `bzlmod`, add following to your WORKSPACE:

```starlark
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "mingw_toolchain",
    remote = "https://github.com/vvviktor/bazel-mingw-toolchain.git",
    commit = "0ea42a31c45f0ff146058cecd124053b6915205e",
)
```
Add following commands to your `.bazelrc` file:
```starlark
build --incompatible_enable_cc_toolchain_resolution             # allow bazel to use custom toolchains
build --extra_toolchains="@mingw_toolchain//toolchain:mingw_cc_toolchain" --extra_execution_platforms="@mingw_toolchain//platform:windows_platform"
build --define=MINGW_PATH="path/to/mingw"                       # define path to yuor mingw location, for example: build --define=MINGW_PATH="C:/msys64/ucrt64" 
build --define=GCC_VERSION="gcc version"                        # define gcc version used, for example: build --define=GCC_VERSION="13.2.0"
common --noenable_bzlmod
```

---
Toolchain allows usage of `--compilation_mode dbg|opt` build option. 

Default flags defined in `config/config.bzl`:
- for all actions: `-Wextra -Wall`
- for `--compilation_mode dbg`: `-g -Og` + linker flags `-Wl,--gc-sections`
- for `--compilation_mode opt`: `-g0 -O3 -DNDEBUG -ffunction-selections -fdata-selections`