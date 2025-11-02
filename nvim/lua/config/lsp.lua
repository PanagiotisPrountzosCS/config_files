local keys = _G.keybinds

vim.pack.add{
		{src = 'https://github.com/neovim/nvim-lspconfig'},
		{src = 'https://github.com/nvim-treesitter/nvim-treesitter'}
}

vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
		callback = function(args)
				local bufnr = args.buf

				local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				map('n', keys.lsp_show_diagnostics, vim.diagnostic.open_float, "Show diagnostics")

				map('n', keys.lsp_jump_to_definition, vim.lsp.buf.definition, "Go to definition")
				map('n', keys.lsp_jump_to_declaration, vim.lsp.buf.declaration, "Go to declaration")
				map('n', keys.lsp_jump_to_implementation, vim.lsp.buf.implementation, "Go to implementation")
				map('n', keys.lsp_hover_message, vim.lsp.buf.hover, "Hover documentation")

				map('n', keys.lsp_switch_header_source, function()
						vim.cmd('LspClangdSwitchSourceHeader')
				end, "Switch header/source (clangd)")
		end,
})

vim.lsp.enable('clangd')
