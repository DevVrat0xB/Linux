# Linux
All the customisation, programs configurations, automation scripts etc to my liking.

# Instructions

# External Dependencies
List of softwares or application that needs to be installed for proper/better functioning. These application needs to be included in the path (i.e. globally accessible). Most of these can be installed via distribution package manager (like dnf) or NPM.

## Environments
Nodejs

## Utilities
* Ripgrep

## Installing Language Servers
Language servers are required for Neovim or any other editor (even VSCode) for the so called "intellisense". List of language servers can be found [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).

Following language server are need to be installed as per the Neovim configurations.
* angularls
* bashls
* clangd
* csharp_ls
* cssls
* dockerls
* gopls
* html
* jsonls
* tsserver

## Installing Fonts
* Extract any of the zip file in fonts folder to location /usr/share/fonts. Make sure this creates a path with the pattern /usr/share/fonts/<font_folder>/font.ttf.
* Build font information cache file by issuing `fc-cache -v` command.
