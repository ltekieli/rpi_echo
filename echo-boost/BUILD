cc_library(
    name = "echo-boost",
    srcs = [
        "echo.cpp",
    ],
    hdrs = [
        "echo.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "@boost//:asio",
    ],
)

cc_binary(
    name = "echo-boostd",
    srcs = [
        "main.cpp",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":echo-boost",
    ],
)
