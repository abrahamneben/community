title: /terminal/i
app: vscode
app: iterm2
language: en

-

git commit [<user.text>]:
    user.insert_between('git commit -n --message "{text}', '"')
git stash: "git stash"

git branch$: "gb\n"
git branch <number_small>: "gb {number_small}"
git checkout develop$: "git checkout develop"

git diff$: "git diff\n"
git fetch: "git fetch\n"
git push$: "git push\n"
git push force$: "git push --force\n"
open pull: "openpr\n"
git add patch$: "git add --patch\n"
git stage all$: "git add ."

git add dot$: "git add .\n"
git pull$: "git pull"
git log$: "git log\n"
git status$: "git status\n"
git reset back <number_small>$: "git reset HEAD~{number_small}"
git reset$: "git reset"
git reset hard$: "git reset --hard"
git branch new <user.text>$:
    user.insert_string_plus_snake_string('git checkout -b ', text)
git rebase develop$: "git rebase origin/develop"
change add: "y\n"
change pass: "n\n"
change end: "q\n"

cancel: key(ctrl-c)

# vim
vim edit:
    key(escape)
    "i"

vim save:
    key(escape)
    ":wq"
    key(enter)

back search: key(ctrl-r)

enter: key(enter)

# chromatic
chromatic tauri: "chr; bazel run --config=tauri-dist //chromatic/sw/apps/tauri/fitting"
chromatic chemist: "chr; bazel run //chromatic/ml/apps/chemist:chemist"
chromatic home: "chr\n"
chromatic settings viewer: "bazel run //chromatic/fw/infra/flux:settings_viewer\n"
chromatic flash buds: "chr; bazel run //chromatic/fw/infra/flux:cli --//chromatic/fw/projects:fw_stamping=forced  -- update buds --model dual"
chromatic lint: "chr; lint\n"
chromatic build mars: "bazel build --board=chromatibud //chromatic/fw/projects/ezairo/8300/apps/mars:nvmi\n"
chromatic clean wine: "rm -rf ~/.wine\n"
chromatic update settings: "chromatic/sw/fitting/parameter_translator/test/update_default_settings.sh\n"

# personal network
connect mac mini: "ssh aneben@macmini.thinlens.net"

# navigation
cd <user.text>: "cd {text}"
el es: "ls\n"
cat <user.text>: "cat {text}"

# docker
docker force up: "docker-compose up -d --force-recreate"

auto complete: key(tab)
exit: "exit"

# bazel
push bazel build: "bazel build "
push bazel test: "bazel test "

# running commands
run last:
    key(up)
    key(enter)
