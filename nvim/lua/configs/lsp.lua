local nvim_lsp = require("lspconfig")

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = {
		"angularls",
		"bashls",
		"clangd",
		"csharp_ls",
		"cssls",
		"dockerls",
		"html",
		"jsonls",
		"tsserver",
    "gopls",
}
-- Use a loop to conveniently call 'setup' on multiple servers
for _, server in ipairs(servers) do
    nvim_lsp[server].setup {
--        capabilities = capabilities,
        settings = {
            gopls = {analyses = {unusedparams = false}, staticcheck = true},
            json = { format = {enabled = false} }
        },
        flags = {debounce_text_changes = 150}
    }
end
