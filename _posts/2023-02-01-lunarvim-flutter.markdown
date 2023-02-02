---
layout: post
title:  "Flutter in LazyVim"
author: "Laurent Vauthrin"
date:   2023-02-01 20:26:54 -0500
categories: vim flutter
---

I've always enjoyed working in Vim because of how lightweight it felt compared to other IDEs despite the extra learning curve and overhead in configuring it.  I've recently tried [LazyVim](https://www.lazyvim.org/) and really liked the look, feel, and configurability.  I've also recently been interested in learning Flutter to quickly prototype mobile apps.  Getting Flutter and LazyVim working together took a bit of learning so I thought I'd share it here.

## Setup

First you'll need to install the following:

* [LazyVim](https://www.lazyvim.org/installation)
* [Flutter](https://flutter.dev/docs/get-started/install)
* [Dart](https://dart.dev/)

Since I'm on a Mac, I used Brew to install NeoVim and Flutter.  Then I followed the instructions on the respective sites.  Note: Flutter seems to install dart so that does not need to be done separately.
```
brew install flutter neovim
```


## Resources


