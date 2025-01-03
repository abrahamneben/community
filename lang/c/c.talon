code.language: c
code.language: cpp
-

# preprocessor
prock <user.c_preproc>:
    "{c_preproc}"

push prock <user.c_preproc>:
    "#{c_preproc} "

push prock include system:
    user.insert_between("#include <", ">")

push prock include local:
    user.insert_between("#include \"", "\"")


# statements
state <user.c_statements>:
    "{c_statements}"

push state <user.c_statements>:
    "{c_statements};\n"



# keywords
key word <user.c_keywords>:
    "{c_keywords}"

push key word <user.c_keywords>:
    "{c_keywords} "

push loop for:
    user.insert_between("for (", " ; ; ")

push loop while:
    "while ("

push block:
    edit.line_end()
    " {\n"

# variables
var <user.c_types>:
    "{c_types}"

push var <user.c_types>:
    "{c_types} "

push var standard list:
    user.insert_between("std::list<", ">")

push var standard vector:
    user.insert_between("std::vector<", ">")

push var standard map:
    user.insert_between("std::map<", ">")

end state: ";\n"


# functions
funk <user.c_functions>:
    "{c_functions}"

push funk <user.c_functions>:
    "{c_functions}("

# operators
op <user.c_operators>:
    "{c_operators}"

push op <user.c_operators>:
    " {c_operators} "

# streams
stream <user.c_streams>:
    "{c_streams}"

push stream <user.c_streams>:
    "{c_streams} << "


end state: ";\n"