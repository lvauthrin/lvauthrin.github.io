# Source: https://github.com/bazelbuild/bazel-website/blob/1138fea04dccfcfc2bd76bab08dda961a4d6149a/scripts/jekyll.bzl

def _impl(ctx):
    """Quick and non-hermetic rule to build a Jekyll site."""
    out_dir = ctx.actions.declare_directory("_site")

#  TODO: Jekyll doesn't follow symlinks so only a portion of files are rendered
    # How do you print a dict in skylark
    ctx.actions.run(
        inputs = ctx.files.srcs,
        outputs = [out_dir],
        executable = "scripts/bundle.sh",
        use_default_shell_env = True,
        #execution_requirements = { "no-sandbox": "True" },
        #arguments = ["exec", "jekyll", "build", "-s", in_dir.path, "-d", out_dir.path, "--verbose"],
        arguments = ["exec", "jekyll", "serve", "-d", out_dir.path, "--verbose"],
    )

    return [DefaultInfo(files = depset([out_dir]))]

jekyll_build = rule(
    implementation = _impl,
    attrs = {
        "srcs": attr.label_list(allow_empty = False),
        "outputs": attr.label_list(allow_empty = False),
        "dir": attr.label(allow_files=True),
    },
)
