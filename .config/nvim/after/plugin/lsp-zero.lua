--[[
local lsp = require('lsp-zero')

-- lsp.preset('recommended')
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

local cmp = require('cmp')

 cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    }
})

local cmp_select = {behaviour = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-space>'] = cmp.mapping.complete(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),

})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})


lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.nvim_workspace()
lsp.setup()
]]--
