filegroup(
    name = "overlays",
    srcs = [
        "//packaging:echo-boostd",
        "//packaging:echo-grpcd",
        "//packaging:wpa_supplicant_conf",
    ],
)

genrule(
    name = "create_image",
    srcs = [
        "genimage.cfg",
        ":overlays",
        "@buildroot_linaro_armv7_system//:boot",
        "@buildroot_linaro_armv7_system//:rootfs",
    ],
    outs = ["sdcard.img"],
    cmd = "$(location create_image.sh) \
                -g $(location genimage.cfg) \
                -r $(location @buildroot_linaro_armv7_system//:rootfs) \
                -b $(location @buildroot_linaro_armv7_system//:boot) \
                -o $(location sdcard.img) \
                $(locations :overlays)",
    tags = [
        "manual",
    ],
    tools = ["create_image.sh"],
)

sh_binary(
    name = "deploy_image",
    srcs = [
        "deploy_image.sh",
    ],
    args = [
        "-i $(location :create_image)",
    ],
    data = [":create_image"],
    tags = [
        "manual",
    ],
)
