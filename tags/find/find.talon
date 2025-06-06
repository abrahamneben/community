tag: user.find
-
hunt this$: edit.find()
hunt this place$:
    edit.find()
    sleep(25ms)
    edit.paste()
hunt selected$:
    edit.copy()
    edit.find()
    sleep(25ms)
    edit.paste()
    key(enter)
hunt this <user.text>$: edit.find(text)
#hunt next: edit.find_next()
#hunt previous: edit.find_previous()
