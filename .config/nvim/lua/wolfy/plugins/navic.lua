local status_ok, navic = pcall(require, 'nvim-navic')
if not status_ok then
	return
end

local status_ok, lsp_config = pcall(require, 'lspconfig')
if not status_ok then
	return
end


