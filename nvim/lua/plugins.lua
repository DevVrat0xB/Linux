local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- LSP
Plug('neovim/nvim-lspconfig')

-- Treesitter (Syntax highlighting, Referencing etc)
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-treesitter/playground')

-- Telescope (general fuzzy finder)
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzy-native.nvim')

-- Auto-Completion
Plug('nvim-lua/completion-nvim')
Plug('glepnir/lspsaga.nvim')

-- NerdTree (File explorer)
Plug('preservim/nerdtree')

vim.call('plug#end')
