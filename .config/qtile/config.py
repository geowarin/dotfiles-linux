import json
import os
import subprocess
from typing import Callable

from libqtile import bar, layout, widget, hook, qtile
from libqtile.backend.base import Window
from libqtile.backend.x11.window import XWindow
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.core.manager import Qtile
from libqtile.group import _Group
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

icons_conf = json.load(open('/home/geo/.config/qtile/icons.json'))

mod = "mod4"
terminal = guess_terminal()

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "left", lazy.layout.grow_main(), desc="Grow window to the left"),
    Key([mod, "control"], "right", lazy.layout.shrink_main(), desc="Grow window to the right"),
    Key([mod, "control"], "down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "up", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod], "space", lazy.window.toggle_floating(), desc="toggle floating"),

    Key([mod], "p", lazy.layout.flip(), desc="Flip (monad)"),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    Key([mod], "d", lazy.spawn("/home/geo/.config/rofi/bin/launcher.sh"), desc="Spawn rofi launcher"),
    Key([mod, "shift"], "e", lazy.spawn("/home/geo/.config/rofi/bin/powermenu.sh"), desc="Spawn rofi exit menu"),

    Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Screenshot"),
    Key([mod], "v", lazy.spawn("/home/geo/.config/rofi/bin/clipmenu.sh"), desc="Clipboard manager"),
    Key([mod], "semicolon", lazy.spawn("rofimoji --skin-tone neutral"), desc="Spawn emoji picker"),

    # Key([mod], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),

    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%"), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%"), desc='volume down'),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc='Volume Mute'),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc='playerctl'),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc='playerctl'),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc='playerctl'),
    Key([], "XF86AudioPause", lazy.spawn("playerctl pause"), desc='playerctl'),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc='playerctl'),

    Key([mod], "w", lazy.spawn("firefox"), desc="Firefox"),
    Key([mod, "shift"], "w", lazy.spawn("firefox --private-window"), desc="Firefox"),
    Key([mod], "n", lazy.spawn("thunar"), desc="Thunar"),

    # Key([mod], "w", lazy.to_screen(0)),
    # Key([mod], "e", lazy.to_screen(1)),

    # Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 10%+"), desc='brightness UP'),
    # Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 10%-"), desc='brightness Down'),
]

group_keys = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "minus", "egrave", "underscore", "ccedilla",
              "agrave"]

groups = [Group(str(i)) for i in range(1, 11)]


def go_to_group(name: str) -> Callable:
    def _inner(qtile: Qtile) -> None:
        group = qtile.groups_map[name]
        if len(qtile.screens) == 1:
            group.cmd_toscreen()
            return

        if name in '12345':
            qtile.focus_screen(0)
            group.cmd_toscreen()
        else:
            qtile.focus_screen(1)
            group.cmd_toscreen()

    return _inner


for g in groups:
    index = int(g.name)
    group = lazy.group[g.name]
    keys.extend([
        Key([mod], group_keys[index - 1], lazy.function(go_to_group(g.name))),
        Key([mod, "shift"], group_keys[index - 1], lazy.window.togroup(g.name), lazy.function(go_to_group(g.name))),
    ])

layouts = [
    layout.MonadTall(),
    layout.Max(),
    # layout.TreeTab(),
]

widget_defaults = dict(
    font="Jetbrains Mono",
    fontsize=14,
    padding=5,
)
extension_defaults = widget_defaults.copy()

layout_icon_widget = widget.CurrentLayoutIcon(scale=0.75)
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(padding=3, linewidth=0, background="#2f343f"),
                layout_icon_widget,
                widget.GroupBox(
                    highlight_method='line',
                    visible_groups=['1', '2', '3', '4', '5']
                ),
                widget.Prompt(),
                # widget.TaskList(
                #     max_title_width=40,
                #     # theme_mode="preferred",
                #     # theme_path="/usr/share/icons/Papirus"
                # ),
                # widget.Spacer(length=5),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Spacer(bar.STRETCH),
                widget.WindowName(),

                widget.CheckUpdates(
                    distro="Arch_paru",
                    mouse_callbacks={'Button1': lazy.spawn("/home/geo/.config/rofi/bin/updates.sh")},
                    padding=5,
                ),

                widget.KeyboardLayout(
                    configured_keyboards=['fr', 'us'],
                ),
                widget.Spacer(5),

                widget.TextBox(
                    text="",
                    padding=0,
                    # background='#4B427E',
                ),
                widget.PulseVolume(),
                widget.Clock(format=" %a %b %d %Y %H:%M"),

                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Sep(padding=3, linewidth=0, background="#2f343f"),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                layout_icon_widget,
                widget.GroupBox(
                    highlight_method='line',
                    visible_groups=['6', '7', '8', '9', '10']
                )
            ], 24
        )
    )
]
# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    # Click([], "Button1", lazy.window.focus()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)


@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([script])


def find_icon(wm_classes: list):
    for wm_class in wm_classes:
        if wm_class in icons_conf:
            return icons_conf[wm_class]
    return wm_classes[-1]


def get_icons(wids: list):
    windows: list = qtile.cmd_windows()

    icons = []
    for wid in wids:
        win = next((x for x in windows if x["id"] == wid), None)
        if win is not None:
            icons.append(find_icon(win["wm_class"]))

    return icons


@hook.subscribe.group_window_add
def on_group_window_add(group: _Group, client: Window):
    window: XWindow = client.window
    current_group = qtile.current_group

    wids = [window.wid for window in group.windows]
    wids.append(window.wid)

    icons = get_icons(wids)
    group.label = "%s %s" % (group.name, " ".join(icons))

    if current_group.name != group.name:
        wids = [window.wid for window in current_group.windows]
        old_icons = get_icons(wids)
        current_group.label = "%s %s" % (current_group.name, " ".join(old_icons))


@hook.subscribe.client_killed
def on_client_killed(client: Window):
    window: XWindow = client.window
    if client.group is not None:
        wids = [window.wid for window in client.group.windows]
        wids.remove(window.wid)

        icons = get_icons(wids)
        client.group.label = "%s %s" % (client.group.name, " ".join(icons))


auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True
# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None
wmname = "LG3D"
