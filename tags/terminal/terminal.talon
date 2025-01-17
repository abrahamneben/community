title: /terminal/i
language: en

-

^<user.git_commands>$:
    "{git_commands}"

^git reset back <number_small>$:
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    "{utility_commands}\n"

^chromatic <user.chromatic_commands>$:
    "{chromatic_commands}\n"

^<user.terminal_commands>$:
    "{terminal_commands}\n"


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
    " back_search\n"

# personal network
connect mac mini: "ssh aneben@macmini.thinlens.net"

# navigation
change directory: "cd "
list files: "ll\n"

# docker
docker force up: "docker-compose up -d --force-recreate"

# bazel
bazel build: "bazel build "
bazel test: "bazel test "

# running commands
run last:
    key(up)
    key(enter)
