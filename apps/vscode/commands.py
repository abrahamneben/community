from talon import Context, Module, actions, settings

mod = Module()

ctx = Context()
ctx.matches = r"""
app: vscode
"""

# add reset, and reset back
ctx.lists["self.git_commands"] = {
    # "git commit": "git commit -n --message \"",
    "git log": "git --no-pager log --pretty=format:\"%h %ad %an %s\" --date=short -n 1000 > /tmp/git_log.out; code /tmp/git_log.out\n",
    "git diff": "git --no-pager diff > /tmp/git_diff.patch; code /tmp/git_diff.patch\n",
    "git commit amend": "git commit -n --amend --no-edit",
    "git stash": "git stash",
    "git stash pop": "git stash pop",
    "git branch": "gb\n",
    "get branch new": "git checkout -b ",
    "get branch delete": "git branch# -D ",
    "git fetch": "git fetch\n",
    "git fetch upstream": "git fetch upstream\n",
    "git push": "git push",
    "git pull": "git pull",
    "git push force": "git push --force",
    "git reset": "git reset",
    "git reset hard": "git reset --hard",
    "git add fuzzy": "git fza\n",
    "git add patch": "git add -p",
    "git stage all": "git add .\n",
    "get status": "git status\n",
    "git cherry": "git cherry-pick ",
    "git cherry abort": "git cherry-pick --abort",
    "change add": "y\n",
    "change pass": "n\n",
    "change pass file": "d\n",
    "change add file": "a\n",
    "git rebase origin develop": "git rebase origin/develop",
    "git checkout fuzzy": "git fzc",
    "git checkout": "git checkout ",
    "git rebase abort": "git rebase --abort ",
    "git you i": "gitui\n",
    "git clean": "git clean -df",
}

ctx.lists["self.utility_commands"] = {
    "source shell config": "source ~/.zshrc",
    "bootstrap install": "pushd ~/bootstrap; python install.py; popd\n",
    "bootstrap save": "pushd ~/bootstrap; python save.py; popd\n",
    "open repo": "open_repo\n",
    "open pull": "open_pull\n",#
    "continue rebase": "continue_rebase\n",
    "go next conflict": "go_next_conflict\n",
    "term run saved": "source /tmp/saved_command.sh\n",
}

ctx.lists["self.chromatic_commands"] = {
    "source shell config": "source ~/.zshrc",
    "bootstrap install": "pushd ~/bootstrap; python install.py; popd\n",
    "bootstrap save": "pushd ~/bootstrap; python save.py; popd\n",
    "open repo": "open_repo\n",
    "open pull": "open_pull\n",
}

ctx.lists["self.terminal_commands"] = {
    "connect mac mini":"ssh abraham@macmini.thinlens.net",
    "change dir up": "cd ..\n",
}


ctx.lists["self.chromatic_commands"] = {
    "tauri": "chr; bazel run --config=tauri-dist //chromatic/sw/apps/tauri/fitting",
    "chemist": "chr; bazel run //chromatic/ml/apps/chemist:chemist\n",
    "home": "chr\n",
    "flash buds": "chr; bazel run //chromatic/fw/infra/flux:cli --//chromatic/fw/projects:fw_stamping=forced  -- update buds --model dual",
    "settings viewer": "bazel run //chromatic/fw/infra/flux:settings_viewer\n",
    "lint": "chr; lint\n",
    "mars": "bazel build --board=chromatibud //chromatic/fw/projects/ezairo/8300/apps/mars:nvmi\n",
    "clean wine": "rm -rf ~/.wine\n",
    "update settings": "chromatic/sw/fitting/parameter_translator/test/update_default_settings.sh\n",
    "update buds": "bazel run  //chromatic/fw/infra/flux:cli --//chromatic/fw/projects:fw_stamping=forced  -- update buds --model dual\n",
}


mod.list("git_commands")
mod.list("utility_commands")
mod.list("terminal_commands")
mod.list("chromatic_commands")


@mod.capture(rule="{self.git_commands}")
def git_commands(m) -> str:
    "Returns a string"
    return m.git_commands

@mod.capture(rule="{self.utility_commands}")
def utility_commands(m) -> str:
    "Returns a string"
    return m.utility_commands

@mod.capture(rule="{self.terminal_commands}")
def terminal_commands(m) -> str:
    "Returns a string"
    return m.terminal_commands

@mod.capture(rule="{self.chromatic_commands}")
def chromatic_commands(m) -> str:
    "Returns a string"
    return m.chromatic_commands
