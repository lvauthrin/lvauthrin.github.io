workspace(name = "personal-site")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Get nodejs rules
http_archive(
    name = "aspect_rules_js",
    sha256 = "ad9fe29a083007fb1ae628f394220a0dae39da3a8d46c4430c920e8892d4ce38",
    strip_prefix = "rules_js-1.17.1",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.17.1/rules_js-v1.17.1.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = DEFAULT_NODE_VERSION,
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    verify_node_modules_ignored = "//:.bazelignore",
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()

