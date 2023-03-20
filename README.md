# Personal Site

This site was originally managed using Jekyll and deployed to Github Pages.  Now this is a work in progress migrating to Firebase using Bazel.  Jekyll still needs to be executed outside of Bazel.

# Notes
To set things up, I needed to create a `pnpm-lock.yaml` file.  To do this, I installed pnpm via Brew and used it to generate the lock file from `package.json`:
```bash
# Install pnpm
brew install pnpm
# Create pnpm lock file
pnpm install --lockfile-only
# Uninstall pnpm
brew uninstall pnpm
```

I also needed to ignore the `node_modules` directory:
```bash
echo "node_modules" > .bazelignore
```

For bundle, I needed to configure packages to be installed in the workspace:
```bash
bundle config set --local path 'vendor/bundle'
```

# Building the site locally
```bash
bazel run build
```

# Serving the site locally
```bash
bazel run serve
```

# Deploying
```bash
bazel run deploy
```

# TODO
* Use the ruby/bundle external rules to make this build hermetic
