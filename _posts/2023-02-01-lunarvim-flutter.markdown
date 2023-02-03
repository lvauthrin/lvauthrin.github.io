---
layout: post
title:  "Flutter in LazyVim"
author: "Laurent Vauthrin"
date:   2023-02-01 20:26:54 -0500
# TODO: What are tags and categories?
categories: ["tech"]
tags: ["vim","flutter"]
---

I've always enjoyed working in Vim because of how lightweight it feels compared to other IDEs despite the extra learning curve and overhead in configuring it.  I've recently tried [LazyVim](https://www.lazyvim.org/) and really liked the look, feel, and ease of use.  I've also recently been interested in learning [Flutter](https://flutter.dev) to quickly prototype mobile apps.  Getting Flutter and LazyVim working together took a bit of learning so I thought I'd share it here.

{:refdef: style="text-align: center;"}
![Dart LSP in LazyVim](/assets/images/vim-dart-lsp.gif)
{: refdef}

### Setup

First you'll need to have the following:

* [LazyVim](https://www.lazyvim.org/installation)
* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/)

Since I'm on a Mac, I used [Brew](https://brew.sh) to install Flutter and [NeoVim](https://neovim.io) (since LazyVim is essentially a set of configurations/plugins for NeoVim) by following the instructions listed in the links above.

**ℹ️ Note:** Flutter seems to install the Dart SDK so that does not need to be done separately.
```bash
brew install flutter neovim
```

### Configuring LunarVim

#### Dart Syntax Highlighting

To configure Dart syntax Highlighting, you can use [TreeSitter](https://tree-sitter.github.io/tree-sitter) which is already bundled with LazyVim.  The only step that's needed is to enable the Dart module:
```
# Run this in LazyVim
:TSInstall dart
```

#### Dart LSP
[Language Server Protocols](https://microsoft.github.io/language-server-protocol/) or LSP allows editors and IDEs to have development features like auto complete, go to definition, etc without having to build it specifically for that editor.  NeoVim and LazyVim come with a [built-in lsp client](https://neovim.io/doc/user/lsp.html) and LazyVim comes with [lsp client configs](https://github.com/neovim/nvim-lspconfig) for a wide variety of languages.  LazyVim also comes with support for installing lsp servers automatically when a client is configured.  This management of lsp servers is handled by [Mason](https://github.com/williamboman/mason.nvim) and [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim).  However, since the Dart SDK [already comes with an lsp server](https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server/tool/lsp_spec) and we already installed that, we just need to configure the client by adding it to the LazyVim configuration.  I did this by creating new plugin config file (`~/.config/nvim/lua/plugins/flutter.lua`) with the following contents:
```lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {},
      },
    },
  },
}
```

#### Flutter Commands

To get Flutter commands (e.g. run/hot-reload/etc) in LazyVim, you can configure [flutter-tools](https://github.com/akinsho/flutter-tools.nvim) by updating the `~/.config/nvim/lua/plugins/flutter.lua` config file with the following config (note I've only enabled it for dart files):
```lua
return {
  -- Flutter commands like hot-reload-on-save
  {
    "akinsho/flutter-tools.nvim",
    config = true,
    ft = "dart",
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dartls = {},
      },
    },
  },
}
```

### Conclusion

Thankfully, most of the work here is done by the plugins and we just needed to put them together.  This isn't as fully featured as some IDEs but it makes the experience of developing Flutter apps much better.  Happy coding!

### Resources
Here are some of the resources I leveraged to get setup:

* [Setup Vim for Flutter Development](https://x-team.com/blog/neovim-flutter/)
* [Create an Android emulator via the command line](http://johnborg.es/2019/04/android-setup-macos.html)

