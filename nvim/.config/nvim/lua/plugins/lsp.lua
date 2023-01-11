-- Set up nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'clangd',
    'sumneko_lua',
  }
})

vim.diagnostic.config({ virtual_text = false })

vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '✘', texthl = 'DiagnosticSignError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '⚠', texthl = 'DiagnosticSignWarn' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticSignInfo' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '⚑', texthl = 'DiagnosticSignHint' }
)

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>lp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>ln', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    if server_name == 'clangd' then
      lspconfig['clangd'].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
        cmd = { 'clangd', '--query-driver=/usr/bin/*g++*' },
      })
    else
      lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
      })
    end
  end,
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.completion.spell,

    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.cpplint.with({
        args = {'--filter=-build/header_guard', '$FILENAME'},
    }),

    null_ls.builtins.formatting.rustfmt,
  },
})

require('lsp-inlayhints').setup()

vim.api.nvim_create_augroup('LspAttach_inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = 'LspAttach_inlayhints',
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require('lsp-inlayhints').on_attach(client, bufnr)
  end,
})
