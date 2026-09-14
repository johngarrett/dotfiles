-- Hyprland desktop configuration for this Arch workstation.
local mainMod = "SUPER"

-- A portable fallback plus the current Apple Studio Display setup.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
hl.monitor({
    output = "HDMI-A-2",
    mode = "3840x2160@60",
    position = "0x0",
    scale = 1.5,
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 4,
        border_size = 0,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 8,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 12,
            render_power = 3,
            color = "rgba(00000055)",
        },
        blur = { enabled = false },
    },
    animations = { enabled = true },
    dwindle = { preserve_split = true },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
    input = {
        kb_layout = "us",
        follow_mouse = 0,
        sensitivity = 0,
    },
})

hl.curve("easeOut", { type = "bezier", points = { {0.22, 1}, {0.36, 1} } })
hl.animation({ leaf = "global", enabled = true, speed = 6, bezier = "easeOut" })
hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "easeOut" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "easeOut" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "easeOut", style = "fade" })

-- Core application and window bindings.
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + E", hl.dsp.layout("togglesplit"))

-- Hyprland groups are the useful equivalent of i3's tabbed/stacked containers.
hl.bind(mainMod .. " + S", hl.dsp.group.toggle())
hl.bind(mainMod .. " + W", hl.dsp.group.next())

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("screenshot-region"))
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd("clipboard-picker"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("session-menu"))

for _, direction in ipairs({ "left", "down", "up", "right" }) do
    local key = ({ left = "H", down = "J", up = "K", right = "L" })[direction]
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ direction = direction }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }))
end

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Resize mode: Super+R enters; H/J/K/L resize; Enter/Escape/Super+R exits.
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"resize\")'"))
hl.define_submap("resize", function()
    hl.bind("H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("Escape", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"\")'"))
    hl.bind("Return", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"\")'"))
    hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.submap(\"\")'"))
end)

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio and media keys work while locked and repeat where useful.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.window_rule({
    name = "float-pavucontrol",
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
})

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
