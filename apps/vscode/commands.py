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
    "git branch fuzzy": "gbz\n",
    "get branch new": "git checkout -b ",
    "get branch delete": "git branch -D ",
    "git fetch": "git fetch\n",
    "git fetch upstream": "git fetch upstream\n",
    "git push": "git push",
    "git pull": "git pull",
    "git push force": "git push --force",
    "git reset": "git reset",
    "git reset hard": "git reset --hard",
    "git stage fuzzy": "fuzzy_git_add\n",
    "git stage patch": "git add -p",
    "git stage all": "git add .\n",
    "get status": "git status\n",
    "git cherry": "git cherry-pick ",
    "git cherry abort": "git cherry-pick --abort",
    "git cherry continue": "git cherry-pick --continue",
    "change add": "y\n",
    "change pass": "n\n",
    "change pass file": "d\n",
    "change add file": "a\n",
    "git rebase origin develop": "git rebase origin/develop",
    "git rebase upstream main": "git rebase upstream/main",
    "git rebase origin": "git rebase origin/",
    "git rebase continue": "git rebase --continue",
    "git checkout fuzzy": "git fzc",
    "git checkout": "git checkout ",
    "git rebase abort": "git rebase --abort ",
    "git you i": "gitui\n",
    "git clean": "git clean -df",
    "copy branch": "echo $b | pbcopy\n",
}

ctx.lists["self.utility_commands"] = {
    "source shell config": "source ~/.zshrc",
    "bootstrap install": "pushd ~/sync/data/bootstrap; python install.py; popd\n",
    "bootstrap save": "pushd ~/sync/data/bootstrap; python save.py; popd\n",
    "open repo": "open_repo\n",
    "open pull": "open_pull\n",#
    "rebase continue": "continue_rebase\n",
    # "go conflict": "go_next_conflict\n", # deprecated in favor of my vs code extension
    "term run saved": "source /tmp/saved_command.sh\n",
    "notebook bazel": "bazel run :notebook -- $PWD --port=9999 --browser=false --NotebookApp.allow_origin='*' --NotebookApp.password='' --NotebookApp.token=''\n",
}

ctx.lists["self.terminal_commands"] = {
    "connect mac mini":"ssh abraham@macmini.thinlens.net",
    "change dir up": "cd ..\n",
}


ctx.lists["self.chromatic_commands"] = {
    "tauri": "chr; bazel run --config=tauri-dist //chromatic/sw/apps/tauri/fitting",
    "chemist": "chr; bazel run //chromatic/ml/apps/chemist:chemist\n",
    "home": "chr\n",
    "settings viewer": "bazel run //chromatic/fw/infra/flux:settings_viewer\n",
    "lint": "chr; lint\n",
    "mars": "bazel build --board=chromatibud //chromatic/fw/projects/ezairo/8300/apps/mars:nvmi\n",
    "clean wine": "rm -rf ~/.wine\n",
    "update settings": "chromatic/sw/fitting/parameter_translator/test/update_default_settings.sh\n",
    "update buds": "bazel run  //chromatic/fw/infra/flux:cli -- update ota\n",
    "update left bud": "bazel run  //chromatic/fw/infra/flux:cli -- update ota --side left\n",
    "update right bud": "bazel run  //chromatic/fw/infra/flux:cli -- update ota --side right\n",
    "bazel out": "chr; code bazel-out\n",
    "flux right": "bazel run //chromatic/fw/infra/flux:messaging -- --side right\n",
    "flux left": "bazel run //chromatic/fw/infra/flux:messaging -- --side left\n",
    "flash rig six": "pushd ~/data/flash_gen2; source readme.txt; popd\n",
}

ctx.lists["self.flux_commands"] = {
    'disable sleep': 'disable_sleep',
    'get beryllium': "get /beryllium/",
    'node catalyst': 'node catalyst',
    'node ezairo': 'node ezairo',
    'node radio': 'node radio',
    'exit': 'exit',
    'case test': 'in_case_diagnostic_tests',
    'accelerometer': 'read_vad',
}

ctx.lists["self.docker_commands"] = {
"docker compose up": "docker-compose up -d --force-recreate",
"docker logs fuzzy": "docker logs -f --since 2m $(fuzzy_find_container)",
"docker restart fuzzy": "docker restart $(fuzzy_find_container)",
"docker stop fuzzy": "docker stop $(fuzzy_find_container)",
"docker start fuzzy": "docker start $(fuzzy_find_container)",
"docker list": "docker ps",
}


mod.list("git_commands")
mod.list("utility_commands")
mod.list("terminal_commands")
mod.list("chromatic_commands")
mod.list("flux_commands")
mod.list("docker_commands")


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

@mod.capture(rule="{self.flux_commands}")
def flux_commands(m) -> str:
    "Returns a string"
    return m.flux_commands

@mod.capture(rule="{self.docker_commands}")
def docker_commands(m) -> str:
    "Returns a string"
    return m.docker_commands
