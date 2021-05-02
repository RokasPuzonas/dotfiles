return {
	theme = "factory",
	modkey = "Mod4",
	altkey = "Mod1",
	terminal = os.getenv("TERM") or "st",
	editor = os.getenv("EDITOR") or "nvim",
	gui_editor = os.getenv("GUI_EDITOR") or "code",
	browser = os.getenv("BROWSER") or "brave",
	screen_locker = "slock",
	vi_focus = false,
	cycle_prev = true
}
