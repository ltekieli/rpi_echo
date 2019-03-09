load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

###################
#
# echod
#
###################
pkg_tar(
    name = "echo-boostd-service",
    srcs = ["//config/systemd:echo-boostd-service"],
    mode = "0644",
    package_dir = "/usr/local/lib/systemd/system",
    symlinks = {
        "/etc/systemd/system/default.target.wants/echo-boostd.service": "/usr/local/lib/systemd/system/echo-boostd.service"
    },
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "echo-boostd-bin",
    srcs = ["//echo-boost:echo-boostd"],
    mode = "0755",
    package_dir = "/usr/local/bin",
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "echo-boostd",
    visibility = ["//visibility:public"],
    deps = [
        "echo-boostd-bin",
        "echo-boostd-service",
    ],
)

###################
#
# server
#
###################
pkg_tar(
    name = "echo-grpcd-service",
    srcs = ["//config/systemd:echo-grpcd-service"],
    mode = "0644",
    package_dir = "/usr/local/lib/systemd/system",
    symlinks = {
        "/etc/systemd/system/default.target.wants/echo-grpcd.service": "/usr/local/lib/systemd/system/echo-grpcd.service"
    },
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "echo-grpcd-bin",
    srcs = ["//echo-grpc:echo-grpcd"],
    mode = "0755",
    package_dir = "/usr/local/bin",
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "echo-grpcd",
    visibility = ["//visibility:public"],
    deps = [
        "echo-grpcd-bin",
        "echo-grpcd-service",
    ],
)

###################
#
# wpa_supplicant
#
###################
pkg_tar(
    name = "wpa_supplicant_conf",
    srcs = ["//config/wpa_supplicant:conf"],
    mode = "0644",
    package_dir = "/etc/wpa_supplicant",
    visibility = ["//visibility:public"],
)
