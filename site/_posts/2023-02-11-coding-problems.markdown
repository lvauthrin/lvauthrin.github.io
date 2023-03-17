---
layout: post
title:  "Bulk Open Urls in VIM"
author: "Laurent Vauthrin"
date:   2023-03-16 20:26:54 -0500
categories: ["tech"]
tags: ["vim", "coding"]
---

A little while ago, where I wanted to open a list of urls (about 20) in my browser.  The urls were interspersed in a Google Doc so I had to do some text manipulation as well.  I could have done this manually but it felt like a good opportunity to learn vim a bit more to make this less tedious.  Here are the steps I used:

1. Copy the entire content of the Google Doc into vim.
2. Use a regex to delete all the unwanted lines:
  ```
  :'<,'>v/^https:\/\/www.linkedin.com/d
  ```
  **Note:** The `v` command allows us to inverse the match and the `d` qualifier deletes the lines.
3. Install a [plugin](https://github.com/dhruvasagar/vim-open-url) to open urls in browsers (e.g. using [VimPlugged](https://github.com/junegunn/vim-plug)) or define your own command/keymapping to open urls in browsers.
4. Execute a normal mode command on the highlighted lines:
  ```
  :'<,'>%norm gB
  ```

That's it!  That should open all the highlighted urls in the browser.
