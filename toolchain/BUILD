# Defines a custom C++ MINGGW toolchain
#
# The point of this file is to show how we're defining a toolchain that triggers
# with //platforms:windows_platform. These match because they both specify
# @platforms//cpu:x86_64.

# This is C++-specific overhead required for all C++ toolchains. See
# toolchain_config.bzl for details.
load(
    "//toolchain:toolchain_config.bzl",
    "mingw_cc_toolchain_config",
)

load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "tool_path",
)

load(
    "//config:config.bzl",
    "COMPILE_FLAGS",
    "DEBUG_COMPILE_FLAGS",
    "OPT_COMPILE_FLAGS",
    "LINK_FLAGS",
    "OPT_LINK_FLAGS",
)

mingw_cc_toolchain_config(
    name = "mingw-cc-toolchain-config",
    toolchain_identifier = "mingw-toolchain",
    host_system_name = "windows",
    target_system_name = "windows",
    cpu = "x86_64",
    target_libc = "nothing",
    compiler = "mingw-gcc",
    abi_libc_version = "nothing",
    compile_flags = COMPILE_FLAGS,
    dbg_compile_flags = DEBUG_COMPILE_FLAGS,
    opt_compile_flags = OPT_COMPILE_FLAGS,
    link_flags = LINK_FLAGS,
    opt_link_flags = OPT_LINK_FLAGS,
)

filegroup(
    name = "toolchain_files",
)

# Define our cc_toolchain
# (https://bazel.build/reference/be/c-cpp#cc_toolchain).
# The cc_toolchain rule is pre-defined by the C++ rule owners. It uses these
# parameters to construct a ToolchainInfo provider, as required by Bazel's
# platform/toolchain APIs.
cc_toolchain(
    name = "mingw_cc_toolchain_definition",
    all_files = ":toolchain_files",
    compiler_files = ":toolchain_files",
    dwp_files = ":toolchain_files",
    linker_files = ":toolchain_files",
    objcopy_files = ":toolchain_files",
    strip_files = ":toolchain_files",
    toolchain_config = ":mingw-cc-toolchain-config",
)

# Bazel's platform/toolchain APIs require this wrapper around the actual
# toolchain defined above. It serves two purposes: declare which
# constraint_values it supports (which can be matched to appropriate platforms)
# and tell Bazel what language this toolchain is for.
#
# So when you're building a cc_binary, Bazel has all the info it needs to give
# that cc_binary the right toolchain: it knows cc_binary requires a "C++-type
# toolchain" (this is encoded in the cc_binary rule definition) and needs to
# use a toolchain that matches whatever you set --platforms to at the command
# line.
toolchain(
    name = "mingw_cc_toolchain",
    target_compatible_with = ["@platforms//cpu:x86_64"],
    toolchain = ":mingw_cc_toolchain_definition",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)