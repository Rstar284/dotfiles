-- LSP settings
local cartographer = require 'cartographer'
local lspconfig = require 'lspconfig'
local on_attach = function(client, buffer)
  cartographer.n.nore.slient.buffer['gd'] = '<cmd>lua vim.lsp.buf.declaration()<CR>'
  cartographer.n.nore.slient.buffer['gD'] = '<cmd>lua vim.lsp.buf.definition()<CR>'
--  cartographer.n.nore.slient.buffer['<leader>gr'] = '<cmd>lua vim.lsp.buf.references()<CR>'
--  cartographer.n.nore.slient.buffer['<leader>gi'] = '<cmd>lua vim.lsp.buf.implementation()<CR>'
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'bashls',  'cssls', 'csharp_ls', 'clangd', 'dockerls', 'denols', 'html', 'jsonls', 'pyright', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

vim.g.markdown_fenced_languages = { -- denols
  "ts=typescript"
}
