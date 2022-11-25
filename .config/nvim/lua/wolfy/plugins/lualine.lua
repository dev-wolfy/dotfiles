local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local colors = {
	blue   = '#61afef',
	green  = '#98c379',
	purple = '#c678dd',
	cyan   = '#56b6c2',
	red1   = '#e06c75',
	red2   = '#be5046',
	yellow = '#e5c07b',
	fg     = '#abb2bf',
	bg     = '#282c34',
	gray1  = '#828997',
	gray2  = '#2c323c',
	gray3  = '#3e4452',
}

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn', 'info', 'hint' },
	symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
	colored = true,
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.cyan },
		hint = { fg = colors.purple },
	},
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	'diff',
	symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
	colored = true,
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	cond = hide_in_width,
}

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = { 'dashboard', 'statusline', 'winbar', 'NVimTree', 'tabline' },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			--tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', diff, diagnostics},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
