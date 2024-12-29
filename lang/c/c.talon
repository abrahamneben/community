code.language: c
code.language: cpp
-
tag(): user.code_imperative

tag(): user.code_block_c_like
tag(): user.code_comment_line
tag(): user.code_comment_block_c_like
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_libraries
tag(): user.code_libraries_gui
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_math
tag(): user.code_operators_pointer

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

# NOTE: migrated from generic, as they were only used here, though once cpp support is added, perhaps these should be migrated to a tag together with the commands below
state include: insert("#include ")
push include system: user.insert_between("#include <", ">")
push include local: user.insert_between('#include "', '"')
state type deaf: insert("typedef ")
state type deaf struct:
    insert("typedef struct")
    insert("{\n\n}")
    edit.up()
    key('tab')

# XXX - create a preprocessor tag for these, as they will match cpp, etc
push define: "#define "
state (undefine | undeaf): "#undef "
state if (define | deaf): "#ifdef "
[state] define <user.text>$:
    "#define {user.formatted_text(text, 'ALL_CAPS,SNAKE_CASE')}"
[state] (undefine | undeaf) <user.text>$:
    "#undef {user.formatted_text(text, 'ALL_CAPS,SNAKE_CASE')}"
[state] if (define | deaf) <user.text>$:
    "#ifdef {user.formatted_text(text, 'ALL_CAPS,SNAKE_CASE')}"

# XXX - preprocessor instead of pre?
state pre if: "#if "
state error: "#error "
state pre else if: "#elif "
state pre end: "#endif "
state pragma: "#pragma "
state default: "default:\nbreak;"

#rrol flow
#best used with a push like command
#the below example may not work in editors that automatically add the closing brace
#if so uncomment the two lines and comment out the rest accordingly
push braces:
    edit.line_end()
    #insert("{")
    #key(enter)
    insert("{}")
    edit.left()
    key(enter)
    key(enter)
    edit.up()

# Declare variables or structs etc.
# Ex. * int myList
<user.c_variable> <phrase>:
    insert("{c_variable} ")
    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

<user.c_variable> <user.letter>: insert("{c_variable} {letter} ")

# Ex. (int *)
cast to <user.c_cast>: "{c_cast}"
standard cast to <user.stdint_cast>: "{stdint_cast}"
var <user.c_types>: "{c_types}"
<user.c_pointers>: "{c_pointers}"
<user.c_keywords>: "{c_keywords}"
<user.c_signed>: "{c_signed}"
standard <user.stdint_types>: "{stdint_types}"
int main: user.insert_between("int main(", ")")

toggle includes: user.code_toggle_libraries()
include <user.code_libraries>:
    user.code_insert_library(code_libraries, "")
    key(end enter)

push comment: "// "

state null pointer: "nullptr"
state stream: "<< "

push gets: "= "
push equal: " == "
push not equal: " != "
push new line: " << \"\\n\";"
push status okay$: "absl::OkStatus()"
push status or$: user.insert_between("absl::StatusOr<", ">")
push status$: "absl::Status "
push constant: "const "
push return: "return "

push debug <number_small>: "std::cout << \"debug {number_small}\\n\";"

push if: user.insert_between("if (", ")")
push continue: "continue;"
push break: "break;"
push var <user.c_types>: "{c_types} "
push using: "using "
push var standard map: user.insert_between("std::map<", "> ")
push var standard list: user.insert_between("std::list<", "> ")
push var standard pair: user.insert_between("std::pair<", "> ")
push const: "const "
push template type: user.insert_between("template <typename", "> ")
push loop for: user.insert_between("for (", ")")
push continue: "continue;"
push void: "void "
push standard out: user.insert_between("std::cout << ", " << std::endl;")

push <user.c_types> funk <user.text>:
    user.insert_between("{c_types} {text}(", ")")

push or equal: "|= "
push shift left: "<< "
push shift right: ">> "
end state: ";\n"
push block:
    edit.line_end()
    " {\n"