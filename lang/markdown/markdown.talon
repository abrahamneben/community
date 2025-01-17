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

{user.markdown_code_block_language} block:
    user.insert_snippet("```{markdown_code_block_language}\n$0\n```")

link:
    "[]()"
    key(left:3)
