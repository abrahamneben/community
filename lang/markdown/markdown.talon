code.language: markdown
code.language: plaintext
-
push header [one]:
    edit.line_end()
    "\n# "
push header two:
    edit.line_end()
    "\n## "
push header three:
    edit.line_end()
    "\n### "


push bullet:
    edit.line_end()
    "\n* "
push sub bullet add:
    edit.line_end()
    "\n  - "

new phrase: ". "

push code block:
    user.insert_between("```\n","\n```")

push code inline:
    user.insert_between("`","`")

link:
    "[]()"
    key(left:3)

