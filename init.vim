"" This is all plugin manager stuff
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'SirVer/ultisnips',
  {'dracula/vim', name = 'dracula'},
  'lervag/vimtex',
  'neovim/nvim-lspconfig',
  'junegunn/fzf',
  'junegunn/fzf.vim',
})
EOF

"" This makes the python integration for ultisnips work
let g:python3_host_prog = '/Users/brishav/.pyenv/versions/3.11.1/envs/nvim/bin/python'

set guicursor=
set mouse=
nnoremap <C-h> :lua vim.lsp.buf.code_action()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-h>"

let g:UltiSnipsEditSplit="vertical"

let g:tex_flavor='latex' "" Default tex file format
let g:vimtex_view_method = 'skim' "" Choose which program to use to view PDF file
let g:vimtex_view_general_viewer = 'skim'
let g:vimtex_compiler_method = 'latexmk'

let g:dracula_colorterm = 0

syntax on
set number
colorscheme dracula
hi Normal ctermbg=none
hi Normal ctermfg=none
set autoindent
set hidden
set tabstop=2
set expandtab
set shiftwidth=2
set backspace=indent,eol,start
set incsearch
autocmd BufNewFile,BufRead *.py set filetype=mypython
autocmd BufNewFile,BufRead *.vimcp set filetype=math
autocmd BufNewFile,BufRead *.tex set syntax=tex
autocmd BufNewFile,BufRead *.md nnoremap <buffer> <C-b> :!pandoc -s -o "%:r.pdf"  % && open -ga Preview "%:r.pdf"<CR><CR>
autocmd BufNewFile,BufRead *.md :syn match markdownIgnore "\$.*\$"
set tags=tags;$HOME
set autoread
set rnu

set exrc
set encoding=utf-8

lua << EOF
local lspconfig = require('lspconfig')
lspconfig.jdtls.setup {}
lspconfig.texlab.setup {}
lspconfig.rust_analyzer.setup {}
EOF
