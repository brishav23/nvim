# Neovim Setup

This is my setup for neovim with some language server support (mostly similar to my stuff for vim).
Since I'm used to vim, I use `init.vim` instead of `init.lua` and just put any lua I may need in a heredoc.
I use [lazy](https://github.com/folke/lazy.nvim) as my plugin manager.

## Differences from Vim

There are some differences in where things are stored between my vim and neovim configurations.
The corresponding directories are listed below:

vim | neovim
--- | ---
`~/.vim/bundle` | `~/.local/share/nvim/lazy`
`~/.config/nvim` | `~/.vim`
`~/.config.nvim/init.vim` | `~/.vim/vimrc`

## Language Servers

I use the `nvim-lspconfig` [plugin](https://github.com/neovim/nvim-lspconfig) to get some easy-to-use
configurations for common language servers so I don't have to deal with configuring them from scratch myself.
The language servers seem to mostly just work and overwrite the normal vim keybinds I would use perfectly.
Auto-complete is triggered _in insert mode_ by using `<C-x><C-o>`.
