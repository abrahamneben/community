code.language: python
-
tag(): user.code_imperative
tag(): user.code_object_oriented

tag(): user.code_comment_documentation
tag(): user.code_comment_line
tag(): user.code_data_bool
tag(): user.code_data_null
tag(): user.code_functions
tag(): user.code_functions_common
tag(): user.code_keywords
tag(): user.code_libraries
tag(): user.code_operators_array
tag(): user.code_operators_assignment
tag(): user.code_operators_bitwise
tag(): user.code_operators_lambda
tag(): user.code_operators_math

settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"

#python-specific grammars
dunder in it: "__init__"
state (def | deaf | deft): "def "
state try: "try:\n"
state except: "except "
state raise: "raise "
self taught: "self."
pie test: "pytest"
state past: "pass"
state self: "self"

[state] raise {user.python_exception}:
    user.insert_between("raise {python_exception}(", ")")
[state] except {user.python_exception}: "except {python_exception}:"

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

from import: user.insert_between("from ", " import ")

type bool: ": bool"
type int: ": int"
type list: ": list["

push dock string: user.insert_between("\"\"\"","\"\"\"")
push comment: "# "
pie lint disable next: "# pylint: disable-next="
pie lint disable: "# pylint: disable="

push self: "self."
push funk: user.insert_between("def ","(): ")
push block:
    edit.line_end()
    "\n"
push print: user.insert_between("print(\"","\")")

end state:
    edit.line_end()
    "\n"

push gets: " = "

num pie array: "np.array("
num pie log ten: "np.log10("
num pie linn space: "np.linspace("
num pie dee be: user.insert_between("20*np.log10(",")")
num pie range: "np.arange("
num pie cosine: "np.cos("
num pie exponent: user.insert_between("np.exp(1j*",")")
num pie tau: "2*np.pi"
num pie absolute: "np.abs("
num pie real: "np.real("
num pie image: "np.imag("
as int: ".astype(np.int32)"

matt plot: "plt.plot("
matt plot figure: "plt.figure("
matt plot label why: user.insert_between("plt.ylabel(\"","\")")
matt plot label ex: user.insert_between("plt.xlabel(\"","\")")
matt plot limit ex: user.insert_between("plt.xlim([","])")
matt plot limit why: user.insert_between("plt.ylim([","])")
matt plot save: user.insert_between("plt.savefig(\"","\", bbox_inches=\"tight\")")
matt plot grid: "plt.grid(which='both')"
