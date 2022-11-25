local status_ok, notify = pcall(require, 'notify')
if not status_ok then
	return
end

notify.setup {
	level = 2,
	timeout = 5000,
	max_width = 150,
	max_height = 10,
	stages = "fade_in_slide_out",
	background_colour = "",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},
	minimum_width = 40,
	render = "default",
	top_down = true

}
