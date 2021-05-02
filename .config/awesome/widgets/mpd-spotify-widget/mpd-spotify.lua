local spawn = require("awful.spawn")
local escape_f = require("awful.util").escape
local focused  = require("awful.screen").focused
local naughty  = require("naughty")
local wibox    = require("wibox")

-- ======================
-- MPD Interface
-- ======================
local MPDInterface = {}
MPDInterface.host = os.getenv("MPD_HOST") or "127.0.0.1"
MPDInterface.port = os.getenv("MPD_PORT") or "6600"
MPDInterface.timeout = 2
MPDInterface.password = ""
MPDInterface.music_dir = os.getenv("HOME") .. "/Music"
MPDInterface.cover_pattern = "*\\.(jpg|jpeg|png|gif)$"
MPDInterface.cover_size = 100
MPDInterface.default_art = nil
MPDInterface.notify = "on"
MPDInterface.followtag = false

function MPDInterface.getStats(callback)
	local stats = {
		player = "mpd",
		random_mode = false,
		single_mode = false,
		repeat_mode = false,
		consume_mode = false,
		pls_pos = "N/A",
		pls_len = "N/A",
		state = "N/A",
		file = "N/A",
		name = "N/A",
		artist = "N/A",
		title = "N/A",
		album = "N/A",
		genre = "N/A",
		track = "N/A",
		date = "N/A",
		time = "N/A",
		elapsed = "N/A"
	}

	local mpdh = string.format("telnet://%s:%s", MPDInterface.host, MPDInterface.port)
	local echo = string.format("printf \"%sstatus\\ncurrentsong\\nclose\\n\"", MPDInterface.password)
	local cmd  = string.format("%s | curl --connect-timeout 1 -fsm 3 %s", echo, mpdh)

	return spawn.easy_async(cmd, function(stdout)
		for line in string.gmatch(stdout, "[^\n]+") do
			for k, v in string.gmatch(line, "([%w]+):[%s](.*)$") do
				if     k == "state"          then stats.state        = v
				elseif k == "file"           then stats.file         = v
				elseif k == "Name"           then stats.name         = escape_f(v)
				elseif k == "Artist"         then stats.artist       = escape_f(v)
				elseif k == "Title"          then stats.title        = escape_f(v)
				elseif k == "Album"          then stats.album        = escape_f(v)
				elseif k == "Genre"          then stats.genre        = escape_f(v)
				elseif k == "Track"          then stats.track        = escape_f(v)
				elseif k == "Date"           then stats.date         = escape_f(v)
				elseif k == "Time"           then stats.time         = v
				elseif k == "elapsed"        then stats.elapsed      = string.match(v, "%d+")
				elseif k == "song"           then stats.pls_pos      = v
				elseif k == "playlistlength" then stats.pls_len      = v
				elseif k == "repeat"         then stats.repeat_mode  = v ~= "0"
				elseif k == "single"         then stats.single_mode  = v ~= "0"
				elseif k == "random"         then stats.random_mode  = v ~= "0"
				elseif k == "consume"        then stats.consume_mode = v ~= "0"
				end
			end
		end

		local do_notify = callback(stats)

		if do_notify and stats.state == "play" then

		elseif stats.state ~= "pause" then
			
		end
	end)
end

-- ======================
-- Spotify Interface
-- ======================
local SpotifyInterface = {}

function SpotifyInterface.getStats(callback)
	local stats = {
		player = "spotify"
	}
	return callback(stats)
end

-- ======================
-- Music Widget
-- ======================
local MusicWidget = {}

local function constructor(options)
	local self = setmetatable(options or {}, { __index = MusicWidget })
	self.active_player = "mpd"
	self.textbox = wibox.widget.textbox()
end

function MusicWidget:update()
end

function MusicWidget:showNotification(stats)

end

return constructor

