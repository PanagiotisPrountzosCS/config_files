local keys = _G.keybinds

--format keymap

vim.keymap.set("n", keys.format, function()
		vim.lsp.buf.format({ async = false })
end, { desc = "Format buffer" })

--on save callback(auto format)

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.c", "*.cpp", "*.h", "*.hpp" },
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
