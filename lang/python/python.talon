code.language: python
-

push {user.python_vocab}: "{python_vocab}"

^push type: ": "
^push return type: " -> "

push block:
    edit.line_end()
    ":\n\t"
