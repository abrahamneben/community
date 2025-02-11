title: /terminal/i
language: en

-

^<user.git_commands>$:
    "{git_commands}"

^git reset back <number_small>$:
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    key(cmd-k)
    "{utility_commands}\n"

^chromatic <user.chromatic_commands>$:
    "{chromatic_commands}\n"

^<user.terminal_commands>$:
    "{terminal_commands}\n"

git commit:
    user.insert_between("git commit -n -m \"", "\"")


cancel: key(ctrl-c)

# vim
vim edit:
    key(escape)
    "i"
vim save:
    key(escape)
    ":wq"
    key(enter)

^back search$:
    key(ctrl-r)


# personal network
connect mac mini: "ssh aneben@macmini.thinlens.net"

# navigation
change dir: "cd "
change dir up: "cd .."
list files: "ll\n"

# docker
docker force up: "docker-compose up -d --force-recreate"

# bazel
bazel build: "bazel build "
bazel test: "bazel test "
bazel verbose: "--config=verbose "
bazel no cache: "--cache_test_results=no "

# running commands
run last:
    key(up)
    key(enter)


term draft:
    key(ctrl-u)
    key(cmd-n)
    key(cmd-v)

term save:
    key(ctrl-u)
    "pbpaste > /tmp/saved_command.sh\n"
