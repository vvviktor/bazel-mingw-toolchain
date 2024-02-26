# MINGW toolchain for bazel projects in Windows
---
Add following strings to your `MODULE.bazel` file:
```
bazel_dep(
    name = "env"
)

git_override(
    module_name = "env",
    remote = "https://github.com/vvviktor/bazel-mingw-toolchain.git",
    commit = "99ddeeb4b28d41b90043be2bd9c3e353702167e2",
)

register_execution_platforms(
    "@env//platform:windows_platform"
)

register_toolchains(
    "@env//toolchain:mingw_cc_toolchain",
)
```
---


