load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "6d6fd834281cb8f8e758dd9ad76df86304bf1869",
    remote = "https://github.com/nelhage/rules_boost",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

boost_deps()

git_repository(
    name = "bazel_buildroot_toolchains",
    commit = "21afea8aa1e306756053ec2c349704b2d547584b",
    remote = "https://github.com/ltekieli/bazel-buildroot-toolchains.git",
)

load("@bazel_buildroot_toolchains//:deps.bzl", bazel_buildroot_toolchains_deps = "repositories")

bazel_buildroot_toolchains_deps()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "build_stack_rules_proto",
    commit = "f5d6eea6a4528bef3c1d3a44d486b51a214d61c2",
    remote = "https://github.com/stackb/rules_proto.git",
)

load("@build_stack_rules_proto//cpp:deps.bzl", "cpp_grpc_library")
cpp_grpc_library()

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")
grpc_deps()
