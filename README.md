# GN vim syntax plugin

This is an improved vim syntax plugin for GN files.

## Installation with a plugin manager

You can use modern plugin managers to download the GN repo and manage the vim
plugin:

Example config for [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'https://github.com/kalcutter/vim-gn'
```

## Manual installation

If you don't use a plugin manager or would prefer to manage the GN repo
yourself, you can add this explicitly to `rtp` in your `.vimrc`:

```vim
set runtimepath+=/path/to/vim-gn
filetype plugin indent on
```

## Formatting GN files

### vim-codefmt (recommended)

[vim-codefmt](https://github.com/google/vim-codefmt) supports the GN filetype
natively. Add the following to your `.vimrc`:

```vim
" Install vim-codefmt and its dependencies
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Optional: configure vim-codefmt to autoformat upon saving the buffer.
augroup CodeFmt
  autocmd!
  autocmd FileType gn AutoFormatBuffer gn
augroup END
```

This will autoformat your files every time you save. If you prefer not to format
files upon saving, vim-codefmt can format the buffer by calling `:FormatCode`.
