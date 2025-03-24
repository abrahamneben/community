code.language: c
-
tag(): user.code_imperative
tag(): user.code_comment_line
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math
tag(): user.code_operators_pointer

slang {user.c_vocab}: "{c_vocab}"

push block:
    edit.line_end()
    " {\n"

end state:
    edit.line_end()
    ";\n"