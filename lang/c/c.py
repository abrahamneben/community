from talon import Context, Module, actions, settings

mod = Module()

ctx = Context()
ctx.matches = r"""
code.language: c
"""

mod.list('c_vocab')

