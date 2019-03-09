genrule(
    name = "conf",
    outs = ["wpa_supplicant-wlan0.conf"],
    cmd = "wpa_passphrase $${WPA_SUPP_SSID} $${WPA_SUPP_PASS} > $@",
    visibility = ["//visibility:public"],
)
