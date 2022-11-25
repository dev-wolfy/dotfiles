local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
	return
end

--[[ lsp_installer.setup({
	automatic_installation = true;
	ui = {
		icons = {
			server_installed = "✓ ",
			server_pending = " ",
			server_uninstalled = "✗ ",
		}
	}
}) ]] --

local servers = {
	{
		name = 'ansiblels',
		opts = {},
	},
	{
		name = 'marksman',
		opts = {},
	},
	{
		name = 'sqls',
		opts = {},
	},
	{
		name = 'bashls',
		opts = {},
	},
	{
		name = 'ccsls',
		opts = {},
	},
	{
		name = 'dockerls',
		opts = {},
	},
	{
		name = 'html',
		opts = {},
	},
	{
		name = 'jsonls',
		opts = require('wolfy.lsp.settings.jsonls'),
	},
	{
		name = 'sumneko_lua',
		opts = require('wolfy.lsp.settings.sumneko_lua'),
	},
	{
		name = 'yamlls',
		opts = {},
	},
	{
		name = 'jedi_language_server',
		opts = {},
	},
}

for _, configured_server in pairs(servers) do
	local server_available, server = lsp_installer.get_server(configured_server.name)
	if server_available then
		server:on_ready(function()
			local opts = {
				on_attach = require('wolfy.lsp.handlers').on_attach,
				capabilities = require('wolfy.lsp.handlers').capabilities,
			}

			server:setup(vim.tbl_deep_extend('force', configured_server.opts, opts))
		end)
		if not server:is_installed() then
			-- Queue the server to be installed.
			server:install()
		end
	end
end
