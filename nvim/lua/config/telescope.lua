local keys = _G.keybinds
local bins = _G.binaries

vim.pack.add{
		{src = "https://github.com/nvim-lua/plenary.nvim"},
		{src = "https://github.com/nvim-telescope/telescope.nvim"}
}

local telescope = require("telescope")
telescope.setup({
		defaults = {
				vimgrep_arguments = {
						vim.fn.expand(bins.telescope_grep),
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--glob=!.git",
						"--glob=!compile_commands.json",
				},
				prompt_prefix = "search > ",
				sorting_strategy = "ascending",
				layout_config = {
						prompt_position = "top",
				},
		},
})

-- Set up keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", keys.telescope_file_search, builtin.find_files, { desc = "File search" })
vim.keymap.set("n", keys.telescope_text_search, builtin.live_grep, { desc = "Text search" })
vim.keymap.set("n", keys.telescope_open_buffers, builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", keys.telescope_help_tags, builtin.help_tags, { desc = "Help Tags" })
