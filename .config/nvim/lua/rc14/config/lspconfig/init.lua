-- Install guides for all language servers can be found here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = { pcall(require, 'cmp-nvim-lsp') }
if cmp_nvim_lsp[1] then
	cmp_nvim_lsp = cmp_nvim_lsp[2]
else
	cmp_nvim_lsp = nil
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if cmp_nvim_lsp then
	capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

local default = {
	capabilities = capabilities,
}

lspconfig.bashls.setup(default)
lspconfig.clangd.setup(default)
lspconfig.cmake.setup(default)
lspconfig.cssls.setup(default)
lspconfig.eslint.setup(default)
lspconfig.html.setup(default)
lspconfig.jsonls.setup(default)
lspconfig.pyright.setup(default)
require('rc14.config.lspconfig.sumneko_lua')
lspconfig.tsserver.setup(default)
lspconfig.vimls.setup(default)