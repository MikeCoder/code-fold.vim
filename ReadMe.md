code-fold.vim
---
[![GitHub version](https://badge.fury.io/gh/MikeCoder%2Fcode-fold.vim.svg)](https://badge.fury.io/gh/MikeCoder%2Fcode-fold.vim)
[![Build Status](https://travis-ci.org/MikeCoder/code-fold.vim.svg?branch=master)](https://travis-ci.org/MikeCoder/code-fold.vim)

Yet, just another code fold plugin for vim.

####Feature
0. **Different views for the same file in different git branches**
1. Save the fold you make when you leave vim.
2. Auto load the view when you open the vim.
3. Easy to install.

####Installation
0. Install [Vundle](https://github.com/VundleVim/Vundle.vim).
1. Add `Plugin 'MikeCoder/code-fold.vim'` to your vimrc.
2. Launch vim and run :PluginInstall.

####How to use
1. Use `v` to select your selection.
2. The use `<leader>zz` or `ff` to fold the code.
3. If you want to unfold the code, just need to use `ff` or `<leader>zz` again.

####Key Bindings
Using `<leader>+zz` and `ff` as default keybindings. If you want to change it to your custom keybindings.

Just add `map {Your keybindings} @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>` to your vimrc file.

####Tips
1. It need the *~/.vim/view* folder, so you should create the folder manually if the plugin inits failed.
2. If you want to clean your previous view files, you can remove the files under *~/.vim/view* folder.
3. If your code-flod.vim plugin not work, you can logout from you system and login again, if the problem not clear, submit issue with the result of *vim --version*.

####Video
![Video](./doc/info.gif)

####TroubleShooting
Submit issue please.

####License
See [License](./LICENSE)

####TODO
See [Todo](./TODO.md)
