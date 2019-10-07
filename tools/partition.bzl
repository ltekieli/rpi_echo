def _partition_ext4(ctx):
    args = ctx.actions.args()
    args.add("-o")
    args.add(ctx.outputs.out)
    args.add("-s")
    args.add(ctx.attr.psize)
    args.add_all(ctx.files.srcs)
    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [ctx.outputs.out],
        executable = ctx.executable._tool,
        arguments = [args],
    )

partition_ext4 = rule(
    implementation = _partition_ext4,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "psize": attr.string(),
        "_tool": attr.label(
            default = Label("//tools:partition.sh"),
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    },
    outputs = {
        "out": "%{name}.ext4",
    },
)
