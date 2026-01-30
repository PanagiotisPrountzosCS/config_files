local keys = _G.keybinds

--format keymap

vim.keymap.set("n", keys.format_file, function()
		vim.lsp.buf.format({ async = false })
end, { desc = "Format buffer" })

vim.keymap.set("v", keys.format_visual, function()
		vim.lsp.buf.format({ range = { ["start"] = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") }, async = false })
end, { desc = "Format buffer" })

--on save callback(auto format)

--vim.api.nvim_create_autocmd("BufWritePre", {
		--	pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
		--	callback = function()
				--		vim.lsp.buf.format({ async = false })
				--	end,
				--})
