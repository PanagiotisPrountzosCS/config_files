--                                _                      ____     
--   ___  ___ ____  ___  ___ ___ ( )___   _______  ___  / _(_)__ _
--  / _ \/ _ `/ _ \/ _ \(_-</ _ \|/(_-<  / __/ _ \/ _ \/ _/ / _ `/
-- / .__/\_,_/_//_/\___/___/ .__/ /___/  \__/\___/_//_/_//_/\_, / 
--/_/                     /_/                              /___/  
--

--basic options
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
--global keymaps

--keymap definitions

_G.keybinds = {
		vim_noh = "<C-h>",
		vim_close_buffer = "<C-x>b",
		lsp_show_diagnostics = "<leader>d",
		lsp_jump_to_definition = "gd",
		lsp_jump_to_declaration = "gD",
		lsp_jump_to_implementation = "gi",
		lsp_hover_message = "K",
		lsp_switch_header_source = "<F4>",
		format_file = "<leader>f",
		format_visual = "<leader>vf",
		file_search = "<C-k>",
		text_search = "<C-g>",
		open_buffers = "<C-b>",
		help_tags = "<leader>h",
		cmp_popup = "<C-Space>",
		cmp_accept_autocomplete = "<Tab>",
		cmp_close_popup = "<Esc>",
}

--binary definitions

_G.binaries = {
		grep_tool = "rg",
		file_finder = "fd",
}

_G.paths = {
}

--submodules

require("config.lsp")
require("config.format")
require("config.git")
require("config.themes")
require("config.fzf")
require("config.autocomplete")
require("config.copilot")

--vim keymaps
vim.keymap.set('n', keybinds.vim_noh, ':noh<CR>', {noremap = true, silent = true})
vim.keymap.set('n', keybinds.vim_close_buffer, ':bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set("n", "<M-j>", "jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", "kzz", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "jzz", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "kzz", { noremap = true, silent = true })
