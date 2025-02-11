# code.language: c
# -

push {user.c_vocab}: "{c_vocab}"

push block:
    edit.line_end()
    " {\n"

push end state:
    edit.line_end()
    ";\n"

push template: user.insert_between("<",">")

