from talon import Context, Module, actions, settings

mod = Module()
ctx = Context()
ctx.matches = r"""
code.language: python
"""

mod.list('python_vocab')

