# neovim-config

## NeoVim setup

1. Clone this repo into proper directory. For example, assuming that you are for Windows that would be
`git clone https://github.com/ashrasmun/neovim-config.git %localappdata%\nvim`. That way you will have your configuration under version control at all times.
2. Use :checkhealth to address any issues related to python and nvim itself.

## After you clone the repo...

Navigate to your local `nvim` config file. You can find it by entering `nvim` and using the `:version` command to check the path. Example `sysinit.nvim` file is available in the repo with minimal content that lets nvim to redirect to config file under version control.

## Trouleshooting

### Wrong resource file used

In case you have Vim and NeoVim installed on the same machine, you may experience a situation when NeoVim uses .vimrc from Vim.
To resolve this, you may remove `%appdata%\nvim-data` directory and remove all the `init.vim` files that you know about. Create a new `init.vim` then and pray it works :)

### Can't open file in already opened NeoVim

Functionality unavailable on Windows... :/ But we will take care of it sooner or later :)
