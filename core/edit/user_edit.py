from talon import Context, Module, actions, clip, settings

ctx = Context()
mod = Module()

@mod.action_class
class UserEditActions:
    def line_delete_up():
        """Delete line above."""
        actions.edit.line_start()
        actions.key("backspace")

    def line_delete_down():
        """Delete line below."""
        actions.edit.line_end()
        actions.key("right backspace")

