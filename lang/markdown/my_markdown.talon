
code.language: markdown
code.language: plaintext
-
header add:
    edit.line_end()
    "\n# "
header two add:
    edit.line_end()
    "\n## "
header three add:
    edit.line_end()
    "\n### "


star add:
    edit.line_end()
    "\n* "
sub star add:
    edit.line_end()
    "\n  - "

new phrase: ". "

# snip code block:
#     user.insert_between("```\n","\n```")

# snip code inline:
#     user.insert_between("`","`")

# link:
#     "[]()"
#     key(left:3)


mark <user.cursorless_target>:
    user.cursorless_vscode_command("abraham_utils.toggleCheckmark", cursorless_target)