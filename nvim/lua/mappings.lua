local defaultOpts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("n", "<Space>", "<Nop>", defaultOpts)
vim.g.mapleader = " "

vim.g.termguicolors = true
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-----------------------------
----- GENERAL MAPPINGS ------
-----------------------------

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", defaultOpts)
map("n", "<C-j>", "<C-w>j", defaultOpts)
map("n", "<C-k>", "<C-w>k", defaultOpts)
map("n", "<C-l>", "<C-w>l", defaultOpts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", defaultOpts)
map("n", "<C-Down>", ":resize +2<CR>", defaultOpts)
map("n", "<C-Left>", ":vertical resize -2<CR>", defaultOpts)
map("n", "<C-Right>", ":vertical resize +2<CR>", defaultOpts)

-- Navigate buffers
map("n", "<A-0>", ":bnext<CR>", defaultOpts)
map("n", "<A-9>", ":bprevious<CR>", defaultOpts)



-----------------------------
----- PLUGINS MAPPING -------
-----------------------------

-- Telescope --
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", defaultOpts)
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", defaultOpts)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", defaultOpts)
-- map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", defaultOpts)

-- look for Neovim's configuration files.
map("n", "<leader>fc", "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", defaultOpts)


-- Nvim-Tree --
map("n", "<leader>ee", "<cmd>NvimTreeToggle<cr>", defaultOpts)
map("n", "<leader>er", "<cmd>NvimTreeRefresh<cr>", defaultOpts)
map("n", "<leader>en", "<cmd>NvimTreeFindFile<cr>", defaultOpts)

