## Edit terminal commands using talon draft-like workflow

* Invoke a fuzzy history search to select a command
* Edit the command in a VSCode editor
* Run the command

<img src="https://i.imgur.com/D3ZjDOT.gif" width="600"/>

Prerequisites:
* Mac
* Zsh
* talon
* VSCode

## Shell Configuration

```
# ~/.zshrc

# Set up a command for fuzzy history search
search_history () {
    PICK=$(history | fzf --tac --scheme=history | sed 's/^ *[0-9]* *//');
    BUFFER="$PICK"
    zle end-of-line
}
zle -N search_history
bindkey '^R' search_history

# Set up a command to "cut" the command at the current prompt
cut_current_command () {
    echo -n "$BUFFER" | pbcopy
    zle kill-whole-line
}
zle -N cut_current_command
bindkey '^U' cut_current_command
```


## Talon Configuration

```
# terminal.talon

# "cut" the command add the current prompt, open a new code editor, paste command
draft command:
    key(ctrl-u)
    key(cmd-n)
    key(cmd-v)

# Invoke fuzzy history search
back search:
    key(ctrl-r)
```

```
# vscode.talon

# Copy file, paste in terminal and run
draft command submit:
    key(cmd-a)
    key(cmd-c)
    user.vscode("workbench.action.terminal.focus")
    sleep(200ms)
    key(cmd-v)
    key(enter)
```