app: vscode
not title: /terminal/i
-

^<user.git_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    insert(git_commands)

^git reset back <number_small>$:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    key(cmd-k)
    insert(utility_commands)

^chromatic <user.chromatic_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    sleep(250ms)
    key(cmd-k)
    insert(chromatic_commands)

term submit:
    key(cmd-a)
    key(cmd-c)
    user.vscode("workbench.action.terminal.focus")
    sleep(200ms)
    key(cmd-v)
    key(enter)

run again:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    key(cmd-k)
    key(ctrl-l)

run again force:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    key(cmd-k)
    key(ctrl-l)
    key(enter)

