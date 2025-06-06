window (new | open): app.window_open()
window next: app.window_next()
window last: app.window_previous()
window close: app.window_close()
window hide: app.window_hide()
app (preferences | prefs | settings): app.preferences()
focus <user.running_applications>: user.switcher_focus(running_applications)

window max: key(cmd-ctrl-enter)
window left: key(cmd-ctrl-h)
window right: key(cmd-ctrl-n)
window big left: key(cmd-ctrl-f)
window big right: key(cmd-ctrl-l)
window top right: key(cmd-ctrl-r)
window bottom right: key(cmd-ctrl-v)
window top left: key(cmd-ctrl-g)
window bottom left: key(cmd-ctrl-m)
window cycle: key(cmd-shift-f12)
spotlight: key(cmd-space)
window quit: key(cmd-q)


# following only works on windows. Can't figure out how to make it work for mac. No idea what the equivalent for linux would be.
#focus$: user.switcher_menu()
#focus last: user.switcher_focus_last()
running list: user.switcher_toggle_running()
running close: user.switcher_hide_running()
launch <user.launch_applications>: user.switcher_launch(launch_applications)

finder open temp: user.system_command("open /tmp")
finder open picks: user.system_command("open /Users/aneben/Pictures")
finder open desktop: user.system_command("open /Users/aneben/Desktop")

snap <user.window_snap_position>: user.snap_window(window_snap_position)
snap next [screen]: user.move_window_next_screen()
snap last [screen]: user.move_window_previous_screen()
snap screen <number>: user.move_window_to_screen(number)
snap <user.running_applications> <user.window_snap_position>:
    user.snap_app(running_applications, window_snap_position)

snap <user.running_applications> [screen] <number>:
    user.move_app_to_screen(running_applications, number)
