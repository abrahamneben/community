from talon import Context, Module, actions, settings

from ..tags.operators import Operators

mod = Module()
ctx = Context()
ctx.matches = r"""
code.language: python
"""

mod.list('python_vocab')

operators = Operators(
    # code_operators_array
    SUBSCRIPT=lambda: actions.user.insert_between("[", "]"),
    # code_operators_assignment
    ASSIGNMENT=" = ",
    ASSIGNMENT_SUBTRACTION=" -= ",
    ASSIGNMENT_ADDITION=" += ",
    ASSIGNMENT_MULTIPLICATION=" *= ",
    ASSIGNMENT_DIVISION=" /= ",
    ASSIGNMENT_MODULO=" %= ",
    ASSIGNMENT_INCREMENT="+= 1",
    ASSIGNMENT_BITWISE_AND=" &= ",
    ASSIGNMENT_BITWISE_OR=" |= ",
    ASSIGNMENT_BITWISE_EXCLUSIVE_OR=" ^= ",
    ASSIGNMENT_BITWISE_LEFT_SHIFT=" <<= ",
    ASSIGNMENT_BITWISE_RIGHT_SHIFT=" >>= ",
    # code_operators_bitwise
    BITWISE_NOT="~",
    BITWISE_AND=" & ",
    BITWISE_OR=" | ",
    BITWISE_EXCLUSIVE_OR=" ^ ",
    BITWISE_LEFT_SHIFT=" << ",
    BITWISE_RIGHT_SHIFT=" >> ",
    # code_operators_lambda
    LAMBDA=lambda: actions.user.insert_between("lambda ", ": "),
    # code_operators_math
    MATH_SUBTRACT=" - ",
    MATH_ADD=" + ",
    MATH_MULTIPLY=" * ",
    MATH_DIVIDE=" / ",
    MATH_MODULO=" % ",
    MATH_EXPONENT=" ** ",
    MATH_EQUAL=" == ",
    MATH_NOT_EQUAL=" != ",
    MATH_GREATER_THAN=" > ",
    MATH_GREATER_THAN_OR_EQUAL=" >= ",
    MATH_LESS_THAN=" < ",
    MATH_LESS_THAN_OR_EQUAL=" <= ",
    MATH_AND=" and ",
    MATH_OR=" or ",
    MATH_NOT="not ",
    MATH_IN=" in ",
    MATH_NOT_IN=" not in ",
)

operators = Operators(
    # code_operators_array
    SUBSCRIPT=lambda: actions.user.insert_between("[", "]"),
    # code_operators_assignment
    ASSIGNMENT=" = ",
    ASSIGNMENT_SUBTRACTION=" -= ",
    ASSIGNMENT_ADDITION=" += ",
    ASSIGNMENT_MULTIPLICATION=" *= ",
    ASSIGNMENT_DIVISION=" /= ",
    ASSIGNMENT_MODULO=" %= ",
    ASSIGNMENT_INCREMENT="+= 1",
    ASSIGNMENT_BITWISE_AND=" &= ",
    ASSIGNMENT_BITWISE_OR=" |= ",
    ASSIGNMENT_BITWISE_EXCLUSIVE_OR=" ^= ",
    ASSIGNMENT_BITWISE_LEFT_SHIFT=" <<= ",
    ASSIGNMENT_BITWISE_RIGHT_SHIFT=" >>= ",
    # code_operators_bitwise
    BITWISE_NOT="~",
    BITWISE_AND=" & ",
    BITWISE_OR=" | ",
    BITWISE_EXCLUSIVE_OR=" ^ ",
    BITWISE_LEFT_SHIFT=" << ",
    BITWISE_RIGHT_SHIFT=" >> ",
    # code_operators_lambda
    LAMBDA=lambda: actions.user.insert_between("lambda ", ": "),
    # code_operators_math
    MATH_SUBTRACT=" - ",
    MATH_ADD=" + ",
    MATH_MULTIPLY=" * ",
    MATH_DIVIDE=" / ",
    MATH_MODULO=" % ",
    MATH_EXPONENT=" ** ",
    MATH_EQUAL=" == ",
    MATH_NOT_EQUAL=" != ",
    MATH_GREATER_THAN=" > ",
    MATH_GREATER_THAN_OR_EQUAL=" >= ",
    MATH_LESS_THAN=" < ",
    MATH_LESS_THAN_OR_EQUAL=" <= ",
    MATH_AND=" and ",
    MATH_OR=" or ",
    MATH_NOT="not ",
    MATH_IN=" in ",
    MATH_NOT_IN=" not in ",
)


@ctx.action_class("user")
class UserActions:
    def code_get_operators() -> Operators:
        return operators

    def code_self():
        actions.auto_insert("self")

    def code_operator_object_accessor():
        actions.auto_insert(".")

    def code_insert_null():
        actions.auto_insert("None")

    def code_insert_is_null():
        actions.auto_insert(" is None")

    def code_insert_is_not_null():
        actions.auto_insert(" is not None")

    def code_state_if():
        actions.user.insert_between("if ", ":")

    def code_state_else_if():
        actions.user.insert_between("elif ", ":")

    def code_state_else():
        actions.insert("else:")
        actions.key("enter")

    def code_state_switch():
        actions.user.insert_between("match ", ":")

    def code_state_case():
        actions.user.insert_between("case ", ":")

    def code_state_for():
        actions.auto_insert("for ")

    def code_state_for_each():
        actions.user.insert_between("for ", " in ")

    def code_state_while():
        actions.user.insert_between("while ", ":")

    def code_define_class():
        actions.auto_insert("class ")

    def code_import():
        actions.auto_insert("import ")

    def code_comment_line_prefix():
        actions.auto_insert("# ")

    def code_state_return():
        actions.insert("return ")

    def code_insert_true():
        actions.auto_insert("True")

    def code_insert_false():
        actions.auto_insert("False")

    def code_comment_documentation():
        actions.user.insert_between('"""', '"""')

    def code_insert_function(text: str, selection: str):
        text += f"({selection or ''})"
        actions.user.paste(text)
        actions.edit.left()

    def code_default_function(text: str):
        actions.user.code_public_function(text)

    def code_private_function(text: str):
        """Inserts private function declaration"""
        result = "def _{}():".format(
            actions.user.formatted_text(
                text, settings.get("user.code_private_function_formatter")
            )
        )

        actions.user.paste(result)
        actions.edit.left()
        actions.edit.left()

    def code_public_function(text: str):
        result = "def {}():".format(
            actions.user.formatted_text(
                text, settings.get("user.code_public_function_formatter")
            )
        )
        actions.user.paste(result)
        actions.edit.left()
        actions.edit.left()

    def code_insert_type_annotation(type: str):
        actions.insert(f": {type}")

    def code_insert_return_type(type: str):
        actions.insert(f" -> {type}")

    def code_break():
        actions.insert("break")

    def code_next():
        actions.insert("continue")

