proto_library(
    name = "echo",
    srcs = ["proto/echo.proto"],
)

load("@build_stack_rules_proto//cpp:cpp_grpc_library.bzl", "cpp_grpc_library")

cpp_grpc_library(
    name = "cpp_echo_proto",
    deps = [":echo"],
    has_services = True,
)

cc_binary(
    name = "echo-grpc-client",
    srcs = [
        "echo_client.cpp",
    ],
    deps = [
        ":cpp_echo_proto",
    ],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "echo-grpcd",
    srcs = [
        "echo_server.cpp",
    ],
    deps = [
        ":cpp_echo_proto",
    ],
    visibility = ["//visibility:public"],
)
