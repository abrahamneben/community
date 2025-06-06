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

# Declare variables or structs etc.
# Ex. * int myList
<user.c_variable> <phrase>:
    insert("{c_variable} ")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

<user.c_variable> <user.letter>: insert("{c_variable} {letter} ")

# Ex. (int *)
cast to <user.c_cast>: "{c_cast}"
standard cast to <user.stdint_cast>: "{stdint_cast}"
<user.c_types>: "{c_types}"
<user.c_pointers>: "{c_pointers}"
<user.c_keywords>: "{c_keywords}"
<user.c_signed>: "{c_signed} "
standard <user.stdint_types>: "{stdint_types}"
int main: user.insert_between("int main(", ")")

include <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)
end state:
    edit.line_end()
    ";\n"
