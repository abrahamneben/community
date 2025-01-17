app: vscode
title: /text editor/i
-

^<user.git_commands>$:
    user.menu_select('File|Save All')
    user.vscode("workbench.action.terminal.focus")
    sleep(700ms)
    "{git_commands}"

^git reset back <number_small>$:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    "{utility_commands}\n"

^chromatic <user.chromatic_commands>$:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    "{chromatic_commands}\n"

