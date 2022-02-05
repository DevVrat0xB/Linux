local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
    return string.format("require(\"configs/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim",
        install_path
    })
    execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
    enable = true, -- enable profiling via :PackerCompile profile=true
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()


-- ------------------- --
-- ------------------- --
-- ACTUAL PLUGINS LIST --
-- ------------------- --
-- ------------------- --
use "wbthomason/packer.nvim"


-- ------------------- --
-- TELESCOPE --
-- (for fuzzy finding the files) --
-- ------------------- --
use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    config = get_config("telescope")
}
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

-- 
use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}
require'nvim-tree'.setup {}		-- it's important for it to be here.

-- ------------------- --
-- Lualine with Web Dev Icons --
-- (status line for Neovim)
-- ------------------- --
use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
}

-- ------------------- --
-- Treesitter --
-- (parser generator tool, builds syntax tree)
-- ------------------- --
use {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate"
}

-- ------------------- --
-- Git Signs --
-- (displays git changes per line)
-- ------------------- --
use {
	"lewis6991/gitsigns.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = get_config("gitsigns")
}

-- ------------------- --
-- Language Server Protocol --
-- (Intellisense)
-- ------------------- --
use {"neovim/nvim-lspconfig", config = get_config("lsp")}

-- ------------------- --
-- Comment --
-- (for commentting, of course)
-- ------------------- --
use {
    "numToStr/Comment.nvim",
    opt = true,
    -- keys = {"gc", "gcc"},
    config = get_config("comment")
}
use {"windwp/nvim-autopairs", config = get_config("autopairs")}

-- ------------------- --
-- Nvim-Cmp --
-- (for auto-completions)
-- ------------------- --
use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"},
				{"hrsh7th/cmp-buffer"},
				{"hrsh7th/cmp-path"},
        {"hrsh7th/cmp-cmdline"},
    },
    config = get_config("cmp")
}

-- ------------------- --
-- Buffer Line --
-- (top status line)
-- ------------------- --
use {
    "akinsho/nvim-bufferline.lua",
    requires = "kyazdani42/nvim-web-devicons",
    event = "BufReadPre",
    config = get_config("bufferline")
}

-- use {"rhysd/vim-grammarous", cmd = "GrammarousCheck"}
