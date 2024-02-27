# MINGW toolchain for bazel projects in Windows

Add following strings to your `MODULE.bazel` file:
```
bazel_dep(
    name = "env"
)

git_override(
    module_name = "env",
    remote = "https://github.com/vvviktor/bazel-mingw-toolchain.git",
    commit = "39dd4d91357e6461e062cc72ec1518d8e35bc67c",
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