from talon import Context, actions

ctx = Context()
ctx.matches = r"""
code.language: batch
"""


@ctx.action_class("user")
class UserActions:
    def code_comment_line_prefix():
        actions.user.insert_snippet_by_name("commentLine")
