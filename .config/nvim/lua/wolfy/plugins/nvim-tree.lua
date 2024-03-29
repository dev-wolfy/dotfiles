
local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

--require("nvim-tree").setup()

nvim_tree.setup({
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = false,
	open_on_setup = true,
	open_on_setup_file = true,
	open_on_tab = false,
	ignore_ft_on_setup = {
		'startify',
		'dashboard',
	},
	update_cwd = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		width = 35,
		hide_root_folder = false,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {
				{ key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
				{ key = 'h', cb = tree_cb('close_node') },
				{ key = 'v', cb = tree_cb('vsplit') },
			},
		},
		number = true,
		relativenumber = false,
	},
	trash = {
		cmd = 'trash',
		require_confirm = true,
	},
	actions = {
		change_dir = {
			enable = true,
			global = false,
		},
		open_file = {
			quit_on_open = false,
			resize_window = false,
			window_picker = {
				enable = true,
				chars = 'hjkl',
				exclude = {
					filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
					buftype = { 'nofile', 'terminal', 'help' },
				},
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = false,
			icons = {
				corner = '└ ',
				edge = '│ ',
				none = '  ',
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = 'before',
			padding = ' ',
			symlink_arrow = ' ➛ ',
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = '',
				symlink = '',
				git = {
					deleted = '✗',
					ignored = '',
					renamed = '',
					staged = '✓',
					unmerged = '',
					unstaged = '',
					untracked = '?',
				},
				folder = {
					default = '',
					open = '',
					empty = '',
					empty_open = '',
					symlink = '',
				},
			},
		},
		highlight_git = true,
	},
})

