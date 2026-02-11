app: vscode
title: /blog/i
-

add post:
    user.vscode_with_arg("workbench.action.tasks.runTask", "New Post")

# add reference:
#     user.vscode_with_arg("workbench.action.tasks.runTask", "New Reference")


run publish:
    user.vscode_with_arg("workbench.action.tasks.runTask", "Published Blog")