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
I couldn't get Jekyll to work with symlinks which is what Bazel prefers.  I believe the Bazel site is actually using Jekyll though and it seems like they have it working 🤔.

# Building site
```bash
.script/bundle.sh exec jekyll build
```

# Serving the site locally
```bash
./script/serve.sh 
```

# Deploying
```
bazel run deploy
```
