local keys = _G.keybinds
local bins = _G.binaries

vim.pack.add{
		{ src = "https://github.com/junegunn/fzf", build = "./install --all" },
		{ src = "https://github.com/junegunn/fzf.vim" },
}

vim.env.FZF_DEFAULT_COMMAND = "fd --type f --hidden --exclude .git --exclude .cache --exclude build --exclude node_modules"
vim.env.FZF_DEFAULT_OPTS = (vim.env.FZF_DEFAULT_OPTS or "") .. " --preview-window=right:50% --no-hscroll"

-- Ripgrep configuration for text search
local rg_opts = {
		"--column",
		"--line-number",
		"--no-heading",
		"--color=always",
		"--smart-case",
		"--hidden",
}

local rg_excludes = {
		".git/*",
		".cache/*",
		"Jenkinsfile",
		"compile_commands.json",
		"README.md",
}

local rg_command = "rg " .. table.concat(rg_opts, " ")
for _, exclude in ipairs(rg_excludes) do
		rg_command = rg_command .. ' --glob "!' .. exclude .. '"'
end

vim.cmd(([[
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
		\   '%s '.shellescape(<q-args>), 1,
		\   fzf#vim#with_preview(), <bang>0)
		]]):format(rg_command))

		vim.keymap.set("n", keys.file_search, ":Files<CR>", {desc="File search (fzf)"})
		vim.keymap.set("n", keys.text_search, ":Rg<CR>", {desc="Text search (" .. (bins.grep_tool or "rg") .. ")"})
		vim.keymap.set("n", keys.open_buffers, ":Buffers<CR>", {desc="Buffers (fzf)"})
		vim.keymap.set("n", keys.help_tags, ":Helptags<CR>", {desc="Help tags (fzf)"})
