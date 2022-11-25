local status_ok, smartsplits = pcall(require, 'smartsplits')
if not status_ok then
	return
end

-- Link: https://github.com/mrjones2014/smart-splits.nvim

smartsplits.setup({
	ignored_filetypes = {
		"nofile",
		"quickfix",
		"qf",
		"prompt",
	},
	ignored_buftypes = { "nofile" },
	resize_mode = {

		quit_key = '<ESC>',

		resize_keys = { 'h', 'j', 'k', 'l' },

		silent = false,

		hooks = {
			on_enter = nil,
			on_leave = nil
		}
	},

	tmux_integration = true,
})

-- resizing splits
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
