local status_ok, marks = pcall(require, 'marks')
if not status_ok then
	return
end

-- https://github.com/chentoast/marks.nvim

marks.setup {
	default_mapping = true,
	signs = true,
	builtin_marks = { ".", "<", ">", "^" },
	cyclic = true,
	force_write_shada = false,
	refresh_interval = 1000,
	sign_priority = {
		lower    = 10,
		upper    = 15,
		builtin  = 8,
		bookmark = 80,
	},
	excluded_filetypes = {},
}
