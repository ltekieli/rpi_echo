proto_library(
    name = "echo",
    srcs = ["proto/echo.proto"],
)

load("@build_stack_rules_proto//cpp:cpp_grpc_library.bzl", "cpp_grpc_library")

cpp_grpc_library(
    name = "cpp_echo_proto",
    has_services = True,
    deps = [":echo"],
)

cc_binary(
    name = "echo-grpc-client",
    srcs = [
        "echo_client.cpp",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":cpp_echo_proto",
    ],
)

cc_binary(
    name = "echo-grpcd",
    srcs = [
        "echo_server.cpp",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":cpp_echo_proto",
    ],
)
