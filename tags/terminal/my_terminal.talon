title: /terminal/i
language: en

-

^<user.git_commands>$:
    insert(git_commands)

^git reset back <number_small>$:
    "git reset HEAD~{number_small}"

^<user.utility_commands>$:
    key(cmd-k)
    insert(utility_commands)

^chromatic <user.chromatic_commands>$:
    insert(chromatic_commands)

^flux <user.flux_commands>$:
    insert(flux_commands)

^<user.terminal_commands>$:
    insert(terminal_commands)

^<user.docker_commands>$:
    insert(docker_commands)

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
change dir up: "cd .."
change dir home: "cd"
list files: "ll\n"


# fuzzy commands
change dir fuzzy: "cd $(fuzzy_find_folder)\n"

ar em file fuzzy: "rm $(fuzzy_find_file)\n"
ar em folder fuzzy: "rm -rf $(fuzzy_find_folder)\n"


# bazel
bazel build: "bazel build "
bazel test: "bazel test "
bazel verbose: "--config=verbose "
bazel no cache: "--cache_test_results=no "

# running commands

term draft:
    key(ctrl-u)
    key(cmd-n)
    key(cmd-v)

term save:
    key(ctrl-u)
    sleep(500ms)
    "pbpaste > /tmp/saved_command.sh\n"

run again:
    key(cmd-k)
    key(ctrl-l)

run again force:
    key(ctrl-l)
    key(cmd-k)
    key(enter)

