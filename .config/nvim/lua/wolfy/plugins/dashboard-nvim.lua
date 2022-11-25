local status_ok, alpha = pcall(require, 'dashboard')
if not status_ok then
	return
end

local db = require('dashboard')
db.custom_header = {
    [[                                   ]],
    [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ]],
    [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
    [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ]],
    [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
    [[          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
    [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
    [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
    [[ ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
    [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ]],
    [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
    [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
    [[     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ]],
    [[     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ]],
    [[     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ]],
    [[                                   ]],
}

db.custom_center = {
	{
		icon = ' ',
		desc = 'New file                        ',
		shortcut = 'e', action = ':e filename <CR>',
		icon_hl = { fg = "#49bb4b" }
	},
	{
		icon = ' ',
		desc = 'Find file                       ',
		shortcut = 'f', action = ':Telescope find_files <CR>',
		icon_hl = { fg = "#2596be" }
	}, 
	{
		icon = ' ',
		desc = 'Recently used files             ',
		shortcut = 'r',
		action = ':Telescope oldfiles <CR>',
		icon_hl = { fg = "#948457" }
	},
	{
		icon = ' ',
		desc = 'Find text                       ',
		shortcut = 't', action = ':Telescope live_grep <CR>'
	},
	{
		icon = ' ',
		desc = 'Configuration                   ',
		shortcut = 'c',
		action = ':NvimTreeOpen ~/.config/nvim/<CR>',
		icon_hl = { fg = "#706f6d" }
	},
	{
		icon = ' ',
		desc = 'Plugins                         ',
		shortcut = 'p',
		action = ':e ~/.config/nvim/lua/wolfy/plugins.lua<CR>',
		icon_hl = { fg = "#8b6db3" }
	},
	{
		icon = ' ',
		desc = 'Quit Neovim                     ',
		shortcut = 'q',
		action = ':qa<CR>',
		icon_hl = { fg = "red" }
	},
}

local function footer()
	local datetime = os.date("    %m-%d-%Y    %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "    v" .. version.major .. "." .. version.minor .. "." .. version.patch
	local signature = "[ Wolfy ]"

	local footer = { signature .. datetime .. nvim_version_info }

	return footer
end

db.custom_footer = footer()

db.hide_statusline = true
db.hide_tabline = true
db.hide_winbar = false
