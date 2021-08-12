# neovim-config

## NeoVim setup

1. Install Python 2.7 and Python 3.7
2. Add python paths to %PATH%. To check if the python is in the path, please use :echo $PATH
3. Copy executables and rename them to python2.7.exe and python3.7.exe
4. Install 'pynvim' package via pip (example: py -2.7 -m pip install --user --upgrade pynvim)
5. Create init.vim file. Place it in a proper location suggested by :checkhealth

## After you clone the repo...

Navigate to your local `nvim` config file. You can find it by entering `nvim` and using the `:version` command to check the path. Example `sysinit.nvim` file is available in the repo with minimal content that lets nvim to redirect to config file under version control.
