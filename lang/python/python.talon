code.language: python
-
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

slang {user.python_vocab}: "{python_vocab}"

snip block:
    edit.line_end()
    ":\n\t"

dock string: user.code_comment_documentation()
dock {user.python_docstring_fields}:
    insert("{python_docstring_fields}")
    edit.left()
dock type {user.code_type}: user.insert_between(":type ", ": {code_type}")
dock returns type {user.code_type}: user.insert_between(":rtype ", ": {code_type}")

toggle imports: user.code_toggle_libraries()
import <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

from import: user.insert_snippet_by_name("importFromStatement")
