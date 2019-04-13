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
        "/etc/systemd/system/default.target.wants/echo-boostd.service": "/usr/local/lib/systemd/system/echo-boostd.service",
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
        "/etc/systemd/system/default.target.wants/echo-grpcd.service": "/usr/local/lib/systemd/system/echo-grpcd.service",
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

###################
#
# network
#
###################
pkg_tar(
    name = "network_conf",
    srcs = ["//config/network:conf"],
    mode = "0644",
    package_dir = "/etc/systemd/network",
    visibility = ["//visibility:public"],
)

###################
#
# hostapd
#
###################
pkg_tar(
    name = "hostapd_conf",
    srcs = ["//config/hostapd:conf"],
    mode = "0644",
    package_dir = "/etc/hostapd",
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "hostapd_service",
    srcs = ["//config/systemd:hostapd-service"],
    mode = "0644",
    package_dir = "/usr/lib/systemd/system",
    symlinks = {
        "/etc/systemd/system/multi-user.target.wants/hostapd.service": "/usr/lib/systemd/system/hostapd.service",
    },
    visibility = ["//visibility:public"],
)

pkg_tar(
    name = "hostapd",
    visibility = ["//visibility:public"],
    deps = [
        "hostapd_conf",
        "hostapd_service",
    ],
)
