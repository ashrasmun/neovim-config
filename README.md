# neovim-config

## NeoVim setup

1. Clone this repo into proper directory. For example, assuming that you are for Windows that would be
`git clone https://github.com/ashrasmun/neovim-config.git %localappdata%\nvim`. That way you will have your configuration under version control at all times.
2. Use :checkhealth to address any issues related to python and nvim itself.

## Some tips related to setting up local config

### tree-sitter

Download the archive from https://github.com/tree-sitter/tree-sitter/releases and unpack it. Don't bother with `npm`.
After that, add the path to this tool to %PATH%.

Install `LLVM`, `node` and `git`. You can also use `zig` instead of `LLVM`.

Finally, run this command in the NeoVim:
`:TSUpdate rust python toml lua zig c cpp perl`

### rust-analyzer

Download the archive from https://github.com/rust-lang/rust-analyzer/releases, unpack it and rename the unpacked file to `rust-analyzer.exe`.
After that, add the path to this tool to %PATH%.

### python

Make a copy of executable and call it `python3`, because noone relies on `py -3` unfortunatelly.
Disable `python3` alias from Windows: https://stackoverflow.com/questions/58754860/cmd-opens-windows-store-when-i-type-python (aka "Zarządzaj aliasami wykonywania aplikacji").

## Trouleshooting

### Wrong resource file used

In case you have Vim and NeoVim installed on the same machine, you may experience a situation when NeoVim uses .vimrc from Vim.
To resolve this, you may remove `%appdata%\nvim-data` directory and remove all the `init.vim` files that you know about. Create a new `init.vim` then and pray it works :)

### Can't open file in already opened NeoVim

Functionality unavailable on Windows... :/ But we will take care of it sooner or later :)
