code.language: python
-
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

slang {user.python_vocab}: "{python_vocab}"

# ^push type: ": "
# ^push return type: " -> "

snip block:
    edit.line_end()
    ":\n\t"

snip type: ": "
snip return type: " -> "
snip self dot: "self."
snip self taught: "self."