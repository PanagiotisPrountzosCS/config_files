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
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
--global keymaps

--keymap definitions

_G.keybinds = {
		lsp_show_diagnostics = "<leader>d",
		lsp_jump_to_definition = "gd",
		lsp_jump_to_declaration = "gD",
		lsp_jump_to_implementation = "gi",
		lsp_hover_message = "K",
		lsp_switch_header_source = "<F4>",
		format = "<leader>f",
		telescope_file_search = "<C-k>",
		telescope_text_search = "<C-g>",
		telescope_open_buffers = "<C-b>",
		telescope_help_tags = "<leader>h",
		cmp_popup = "<C-Space>",
		cmp_accept_autocomplete = "<Tab>",
		cmp_close_popup = "<Esc>"
}

--binary definitions
--These can be the programs a package looks for, e.g. ripgrep for telescope.nvim

_G.binaries = {
		telescope_grep = "rg"
}

--submodules

require("config.lsp")
require("config.format")
require("config.git")
require("config.themes")
require("config.telescope")
require("config.autocomplete")
