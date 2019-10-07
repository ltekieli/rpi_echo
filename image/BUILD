load("//tools:partition.bzl", "partition_ext4")
load("//tools:image.bzl", "image")


filegroup(
    name = "overlays",
    srcs = [
        "@buildroot_linaro_armv7_system//:rootfs",
        "//packaging:echo-grpcd",
        "//packaging:hostapd",
        "//packaging:network_conf",
    ],
)

partition_ext4(
    name = "rootfs",
    srcs = [
        ":overlays",
    ],
    psize = "256000",
    tags = [
        "manual",
    ],
)

image(
    name = "sdcard",
    config = "genimage.cfg",
    srcs = [
        "@buildroot_linaro_armv7_system//:boot",
        ":rootfs.ext4",
    ],
    tags = [
        "manual",
    ],
)

sh_binary(
   name = "deploy",
   srcs = [
       "//tools:deploy.sh",
   ],
   args = [
       "-i $(location :sdcard.img)",
   ],
   data = [":sdcard.img"],
   tags = [
       "manual",
   ],
)
