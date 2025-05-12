app: chrome
title: /paperless/i
-

# Document spread view
spread focus:
    key(cmd-shift-f17)
filter reset:
    key(cmd-shift-f18)
filter tag:
    key(cmd-shift-f19)
hunt focus:
    key(cmd-shift-f20)

# Document actions
dock save:
    key(cmd-s)
dock neck:
    key(cmd-shift-s)
    key(cmd-right)
dock prev:
    key(cmd-left)
dock delete:
    key(cmd-shift-f6)
dock trash:
    key(cmd-shift-f8)
dock download:
    key(cmd-shift-f7)


# Document detail panel
detail focus:
    key(cmd-shift-f9)
tag focus:
    key(cmd-shift-f10)
date focus:
    key(cmd-shift-f11)
# type focus:
#     key(cmd-shift-f12)
serial focus:
    key(cmd-shift-f13)
title focus:
    key(cmd-shift-f14)

# Document note panel
dock note:
    key(cmd-shift-f15)
    sleep(400ms)
    key(cmd-shift-f16)

