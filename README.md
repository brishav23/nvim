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

## Python integration and UltiSnips

For UltiSnips to work, neovim needs to be able to find python.
The simplest way to accomplish this is to first create a python virtualenv
with the neovim module (run `pip install neovim`) and then setting:

```
let g:python3_host_prog = '/full/path/to/virtualenv/python'
```

in the `init.vim` file.

## Language Servers

I use the `nvim-lspconfig` [plugin](https://github.com/neovim/nvim-lspconfig) to get some easy-to-use
configurations for common language servers so I don't have to deal with configuring them from scratch myself.
The language servers seem to mostly just work and overwrite the normal vim keybinds I would use perfectly.
Auto-complete is triggered _in insert mode_ by using `<C-x><C-o>`.

I have an example of how to use a pre-made configuration from `nvim-lspconfig`
with a Java language server (`jdtls`) in the `init.vim` file.
For any new language servers you want to use, you should add the config to
the `init.vim` file in a similar manner.
