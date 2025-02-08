app: vscode
not title: /terminal/i
-

^<user.git_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(1000ms)
    key(ctrl-c)
    "{git_commands}"

^git reset back <number_small>$:
    user.vscode("workbench.action.terminal.focus")
    sleep(1000ms)
    key(ctrl-c)
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(1000ms)
    key(ctrl-c)
    "{utility_commands}\n"

^chromatic <user.chromatic_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(1000ms)
    key(ctrl-c)
    "{chromatic_commands}\n"


draft command submit:
    key(cmd-a)
    key(cmd-c)
    user.vscode("workbench.action.terminal.focus")
    sleep(200ms)
    key(cmd-v)
    key(enter)