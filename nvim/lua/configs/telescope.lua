local actions = require'telescope.actions'
require('telescope').setup{
  defaults = {
		initial_mode = 'insert',
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

		color_devicons = true,
		prompt_prefix = "> ",

    mappings = {
      i = {
				["<ESC>"] = actions.close,
        ["<M-j>"] = actions.move_selection_next,
        ["<M-k>"] = actions.move_selection_previous,
      }
    },

		file_ignore_patterns = {
			"node_modules",
			"build",
			"dist",
			"*.svg",
			"*.jpe?g",
			"*.ico"
		},
  },
}

require('telescope').load_extension('fzf')
