---@diagnostic disable: undefined-global

-- Environment
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Basic settings
hl.config({
    input = {
        repeat_rate  = 50,
        repeat_delay = 400,
    },
    general = {
        gaps_in     = 4,
        gaps_out    = 4,
        border_size = 3,
        col         = {
            active_border   = "rgb(88c0d0)",
            inactive_border = "rgba(88c0d000)",
        },
    },
    decoration = {
        rounding = 0,
    },
    animations = {
        enabled = false,
    },
    group = {
        col = {
            border_active   = "rgb(88c0d0)",
            border_inactive = "rgba(88c0d000)",
        },
        groupbar = {
            enabled          = false,
            indicator_gap    = 0,
            indicator_height = 13,
            priority         = 3,
            render_titles    = false,
            col              = {
                active   = "rgb(8fbcbb)",
                inactive = "rgb(4c566a)",
            },
        },
    },
})

-- Workspaces
for i = 1, 6 do
    hl.workspace_rule({ workspace = tostring(i), persistent = true })
end
hl.workspace_rule({
    workspace        = "special:scratch",
    gaps_out         = { top = 100, right = 150, bottom = 100, left = 150 },
    on_created_empty = "wezterm-gui",
})

-- Window Rules
hl.window_rule({ match = { class = "dev.zed.Zed" }, workspace = "3" })
hl.window_rule({ match = { class = "cursor" }, workspace = "3" })
hl.window_rule({ match = { class = "deluge" }, workspace = "5" })
hl.window_rule({ match = { class = "org.telegram.desktop" }, workspace = "5" })
hl.window_rule({ match = { class = "Microsoft-edge" }, workspace = "6" })

-- workspace effect with " silent" suffix (not a separate field)
hl.window_rule({ match = { title = "^(.* is sharing your screen%.)$" }, workspace = "special:hidden silent" })
hl.window_rule({ match = { title = "^(Select what to share)$" }, float = true, size = "1000 800" })

-- group effect is a string, not a table
hl.window_rule({ match = { class = ".*" }, group = "set always" })
hl.window_rule({ match = { class = "nemo" }, float = true, group = "override barred" })
hl.window_rule({ match = { class = "swappy" }, float = true, group = "override barred" })
hl.window_rule({ match = { class = "org.telegram.desktop", title = "Media viewer" }, suppress_event = "fullscreen" })

-- Window Management
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Group Management
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + Space", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + G", hl.dsp.group.lock({ action = "toggle" }))

-- Launch bindings
hl.bind("SUPER + Return", hl.dsp.exec_cmd("wezterm-gui connect unix --workspace main"))
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratch"))
hl.bind("ALT + Return", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("ALT + O", hl.dsp.exec_cmd("rofi -show audio"))
hl.bind("ALT + B", hl.dsp.exec_cmd("rofi -show bluetooth"))
hl.bind("ALT + Q", hl.dsp.exec_cmd("rofi -show power"))
hl.bind("ALT + N", hl.dsp.exec_cmd("rofi -show network"))
hl.bind("ALT + D", hl.dsp.exec_cmd("rofi-dns"))
hl.bind("ALT + R", hl.dsp.exec_cmd("rofi-books ~/HDD/books"))
hl.bind("ALT + P", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Volume controls
hl.bind("SUPER + Up", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"), { locked = true, repeating = true })
hl.bind("SUPER + Down", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

-- Monitor brightness
hl.bind("SUPER + Prior", hl.dsp.exec_cmd("ddcutil setvcp 10 + 5"), { locked = true, repeating = true })
hl.bind("SUPER + Next", hl.dsp.exec_cmd("ddcutil setvcp 10 - 5"), { locked = true, repeating = true })
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 + 5"), { locked = true, repeating = true })
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 - 5"), { locked = true, repeating = true })

-- Workspace navigation with wrap-around
hl.bind("SUPER + Right", function()
    local id = hl.get_active_workspace().id
    hl.dispatch(hl.dsp.focus({ workspace = (id % 6) + 1 }))
end)
hl.bind("SUPER + Left", function()
    local id = hl.get_active_workspace().id
    hl.dispatch(hl.dsp.focus({ workspace = (id - 2 + 6) % 6 + 1 }))
end)
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + Tab", hl.dsp.focus({ workspace = "previous" }))

-- Workspace switching
for i = 1, 6 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Extras
hl.bind("SUPER + Delete", hl.dsp.exec_cmd("hyprshot copy area"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exit())
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("hyprlock"))

-- Mouse window management
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Startup (runs once, not on config reload)
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset -t 6000")
    hl.exec_cmd("wezterm-mux-server --daemonize")
    hl.exec_cmd("Telegram -startintray")
    -- hl.exec_cmd("syncthing --no-browser")
    -- hl.exec_cmd("discord --start-minimized")
    hl.exec_cmd("systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("pkill waybar; waybar")
end)

local function update_groupbar()
    local ws = hl.get_active_workspace()
    local windows = hl.get_windows()
    local count = 0
    for _, win in ipairs(windows) do
        if win.workspace.id == ws.id and not win.floating then
            count = count + 1
        end
    end
    hl.config({
        group = { groupbar = { enabled = count > 1 } },
    })
end

hl.on("workspace.active", update_groupbar)
hl.on("window.open", update_groupbar)
hl.on("window.destroy", update_groupbar)
hl.on("config.reloaded", update_groupbar)
