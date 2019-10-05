def _image(ctx):
    args = ctx.actions.args()
    args.add("-o")
    args.add(ctx.outputs.out)
    args.add("-g")
    args.add(ctx.file.config)
    args.add_all(ctx.files.srcs)
    ctx.actions.run(
        inputs = ctx.files.srcs + [ctx.file.config],
        outputs = [ctx.outputs.out],
        executable = ctx.executable._tool,
        arguments = [args],
    )

image = rule(
    implementation = _image,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "config": attr.label(allow_single_file = True),
        "_tool": attr.label(
            default = Label("//tools:image.sh"),
            allow_single_file = True,
            executable = True,
            cfg = "host",
        ),
    },
    outputs = {
        "out": "%{name}.img",
    },
)
