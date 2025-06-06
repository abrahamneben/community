from talon import Context, Module, actions, settings

from ..tags.operators import Operators

mod = Module()

ctx = Context()
ctx.matches = r"""
code.language: c
"""

mod.list('c_vocab')



operators = Operators(
    SUBSCRIPT=lambda: actions.user.insert_between("[", "]"),
    ASSIGNMENT=" = ",
    ASSIGNMENT_ADDITION=" += ",
    ASSIGNMENT_SUBTRACTION=" -= ",
    ASSIGNMENT_MULTIPLICATION=" *= ",
    ASSIGNMENT_DIVISION=" /= ",
    ASSIGNMENT_MODULO=" %= ",
    ASSIGNMENT_INCREMENT="++",
    ASSIGNMENT_BITWISE_AND=" &= ",
    ASSIGNMENT_BITWISE_OR=" |= ",
    ASSIGNMENT_BITWISE_EXCLUSIVE_OR=" ^= ",
    ASSIGNMENT_BITWISE_LEFT_SHIFT=" <<= ",
    ASSIGNMENT_BITWISE_RIGHT_SHIFT=" >>= ",
    BITWISE_AND=" & ",
    BITWISE_OR=" | ",
    BITWISE_NOT="~",
    BITWISE_EXCLUSIVE_OR=" ^ ",
    BITWISE_LEFT_SHIFT=" << ",
    BITWISE_RIGHT_SHIFT=" >> ",
    MATH_SUBTRACT=" - ",
    MATH_ADD=" + ",
    MATH_MULTIPLY=" * ",
    MATH_DIVIDE=" / ",
    MATH_MODULO=" % ",
    MATH_EQUAL=" == ",
    MATH_NOT_EQUAL=" != ",
    MATH_GREATER_THAN=" > ",
    MATH_GREATER_THAN_OR_EQUAL=" >= ",
    MATH_LESS_THAN=" < ",
    MATH_LESS_THAN_OR_EQUAL=" <= ",
    MATH_AND=" && ",
    MATH_OR=" || ",
    MATH_NOT="!",
    POINTER_INDIRECTION="*",
    POINTER_ADDRESS_OF="&",
    POINTER_STRUCTURE_DEREFERENCE="->",
)


@ctx.action_class("user")
class UserActions:
    def code_get_operators() -> Operators:
        return operators

    def code_insert_null():
        actions.auto_insert("NULL")

    def code_insert_is_null():
        actions.auto_insert(" == NULL ")

    def code_insert_is_not_null():
        actions.auto_insert(" != NULL")

    def code_state_if():
        actions.user.insert_snippet_by_name("ifStatement")

    def code_state_else_if():
        actions.user.insert_snippet_by_name("elseIfStatement")

    def code_state_else():
        actions.user.insert_snippet_by_name("elseStatement")

    def code_state_switch():
        actions.user.insert_snippet_by_name("switchStatement")

    def code_state_case():
        actions.user.insert_snippet_by_name("caseStatement")

    def code_state_for():
        actions.user.insert_snippet_by_name("forLoopStatement")

    def code_state_go_to():
        actions.user.insert_snippet_by_name("goToStatement")

    def code_state_while():
        actions.user.insert_snippet_by_name("whileLoopStatement")

    def code_state_return():
        actions.auto_insert("return ")

    def code_break():
        actions.auto_insert("break;")

    def code_next():
        actions.auto_insert("continue;")

    def code_insert_true():
        actions.auto_insert("true")

    def code_insert_false():
        actions.auto_insert("false")

    def code_comment_line_prefix():
        actions.user.insert_snippet_by_name("commentLine")

    def code_insert_function(text: str, selection: str):
        if selection:
            text = text + f"({selection})"
        else:
            text = text + "()"

        actions.user.paste(text)
        actions.edit.left()

    # TODO - it would be nice that you integrate that types from c_cast
    # instead of defaulting to void
    def code_private_function(text: str):
        """Inserts private function declaration"""
        result = "void {}".format(
            actions.user.formatted_text(
                text, settings.get("user.code_private_function_formatter")
            )
        )

        actions.user.code_insert_function(result, None)

    def code_private_static_function(text: str):
        """Inserts private static function"""
        result = "static void {}".format(
            actions.user.formatted_text(
                text, settings.get("user.code_private_function_formatter")
            )
        )

        actions.user.code_insert_function(result, None)

    def code_insert_library(text: str, selection: str):
        actions.user.paste(f"#include <{text}>")
