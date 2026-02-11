app: chrome
-
tag(): browser
tag(): user.tabs

profile switch: user.chrome_mod("shift-m")

tab search: user.chrome_mod("shift-a")

tab search <user.text>$:
    user.chrome_mod("shift-a")
    sleep(200ms)
    insert("{text}")
    key(down)

tab reload: user.chrome_mod("cmd-r")
copy address:
    key(cmd-l)
    key(cmd-c)
    key(escape)

go address:
    key(cmd-l)
