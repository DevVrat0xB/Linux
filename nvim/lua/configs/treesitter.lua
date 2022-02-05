require"nvim-treesitter.configs".setup {
    ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"markdown",
        "typescript",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages

    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {} -- list of language that will be disabled
    },
}
