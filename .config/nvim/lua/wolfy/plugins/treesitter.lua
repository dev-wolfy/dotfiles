local treesitter_status_ok, treesitter = pcall(require, 'treesitter')
if not treesitter_status_ok then
	return
end

require 'nvim-treesitter.configs'.setup {

	ensure_installed = {
		"bash",
		"c",
		"c_make",
		"cpp",
		"css",
		"dockerfile",
		"gitignore",
		"go",
		"html",
		"http",
		"javascript",
		"json",
		"lua",
		"markdown",
		"php",
		"python",
		"regex",
		"rust",
		"sql",
		"vim",
	},

	sync_install = false,

	auto_install = true,

	ignore_install = {},

	highlight = {

		enable = true, -- Enable the plugin

		disable = {}, -- Disable parser
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		--[[ disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end, ]] --

		additional_vim_regex_highlighting = false,
	},
}
