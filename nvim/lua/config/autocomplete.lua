local keys = _G.keybinds

vim.pack.add{
		{src = "https://github.com/hrsh7th/nvim-cmp"},
		{src = "https://github.com/hrsh7th/cmp-nvim-lsp"},
		{src = "https://github.com/hrsh7th/cmp-buffer"},
		{src = "https://github.com/hrsh7th/cmp-path"},
		{src = "https://github.com/L3MON4D3/LuaSnip"},
}

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  completion = {
    autocomplete = false,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    [keys.cmp_popup] = cmp.mapping.complete(),
    [keys.cmp_accept_autocomplete] = cmp.mapping.confirm({ select = true }),
    [keys.cmp_close_popup] = cmp.mapping.abort(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})
