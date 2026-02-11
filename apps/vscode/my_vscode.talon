#custom vscode commands go here
app: vscode

-
tag(): user.find_and_replace
tag(): user.line_commands
tag(): user.multiple_cursors
tag(): user.splits
tag(): user.tabs
tag(): user.command_search

go last:
    user.vscode("workbench.action.openPreviousRecentlyUsedEditorInGroup")
go next: user.vscode("workbench.action.openNextRecentlyUsedEditorInGroup")

# VSCode Snippets
snip (last | prev): user.vscode("jumpToPrevSnippetPlaceholder")
snip neck: user.vscode("jumpToNextSnippetPlaceholder")

# windows
window reload: user.vscode("workbench.action.reloadWindow")
window close: user.vscode("workbench.action.closeWindow")
window new: user.menu_select('File|New Window')

# go view [<user.text>]:
#     user.vscode("workbench.action.openView")
#     insert(user.text or "")

# Sidebar
bar explore: user.vscode("workbench.view.explorer")
file select: key(space)
# focus extensions: user.vscode("workbench.view.extensions")
# bar outline: user.vscode("outline.focus")
# bar run: user.vscode("workbench.view.debug")
# bar search: user.vscode("workbench.view.search")
# bar source: user.vscode("workbench.view.scm")
# bar test: user.vscode("workbench.view.testing.focus")
bar toggle: user.vscode("workbench.action.toggleSidebarVisibility")

# Debug
debug run: user.vscode("workbench.action.debug.start")

# Symbol search
# symbol hunt [<user.text>]:
#     user.vscode("workbench.action.gotoSymbol")
#     sleep(50ms)
#     insert(text or "")

# symbol hunt all [<user.text>]:
#     user.vscode("workbench.action.showAllSymbols")
#     sleep(50ms)
#     insert(text or "")

# Hunting
hunt file [<user.text>]$:
    user.vscode("workbench.action.quickOpen")

hunt case: user.vscode("toggleFindCaseSensitive")
hunt regular: user.vscode("toggleFindRegex")
hunt replace: user.vscode("editor.action.startFindReplaceAction")
hunt replace go: key(cmd-enter)
hunt all prev: user.vscode("search.action.focusPreviousSearchResult")
hunt all neck: user.vscode("search.action.focusNextSearchResult")

hunt prev:
    key(cmd-f)
    key(shift-enter)

hunt neck:
    key(cmd-f)
    key(enter)


# file actions
folder delete:
    user.vscode("dynoFileUtils.deleteFolder")
file create:
    user.vscode("dynoFileUtils.newItemsAtCurrentPath")
file create root:
    user.vscode("dynoFileUtils.newItemsAtRoot")
file rename:
    user.vscode("dynoFileUtils.renameFile")
file move:
    user.vscode("dynoFileUtils.moveFile")
file clone:
    user.vscode("dynoFileUtils.duplicateFile")
file delete:
    user.vscode("dynoFileUtils.deleteFile")
file open: user.vscode("workbench.action.files.openFileFolder")

file copy path root: user.vscode("copyFilePath")
file copy path: user.vscode("copyRelativeFilePath")
file source:
    user.menu_select('File|Save')
    user.vscode("copyFilePath")
    user.vscode("workbench.action.terminal.focus")
    key(ctrl-c)
    sleep(500ms)
    insert("source ")
    user.vscode("execPaste")
    key(enter)


file reveal:
    user.menu_select('File|Save')
    user.vscode("copyFilePath")
    user.vscode("workbench.action.terminal.focus")
    key(ctrl-c)
    sleep(500ms)
    insert("open $(dirname ")
    user.vscode("execPaste")
    insert(")")
    key(enter)

#code navigation
# (go declaration | follow): user.vscode("editor.action.revealDefinition")
go back: user.vscode("workbench.action.navigateBack")
go forward: user.vscode("workbench.action.navigateForward")
# go implementation: user.vscode("editor.action.goToImplementation")
# go type: user.vscode("editor.action.goToTypeDefinition")
# go usage: user.vscode("references-view.find")
go recent:
    user.vscode("workbench.action.openRecent")

# go edit: user.vscode("workbench.action.navigateToLastEditLocation")
jump line <number>: edit.jump_line(number)

# editor focus
file focus one: user.vscode("workbench.action.focusFirstEditorGroup")
file focus: user.vscode("workbench.action.focusFirstEditorGroup")
file focus two: user.vscode("workbench.action.focusSecondEditorGroup")
file focus three: user.vscode("workbench.action.focusThirdEditorGroup")
file focus four: user.vscode("workbench.action.focusFourthEditorGroup")
file move left: user.vscode("workbench.action.moveEditorToPreviousGroup")
file move right: user.vscode("workbench.action.moveEditorToNextGroup")
file split: user.menu_select('View|Editor Layout|Split Right')

# layout
layout one file: user.vscode('workbench.action.editorLayoutSingle')
layout two files: user.vscode('workbench.action.editorLayoutTwoColumns')
layout three files: user.vscode('workbench.action.editorLayoutThreeColumns')
layout four files: user.vscode('workbench.action.editorLayoutFourColumns')
layout grid: user.menu_select('View|Editor Layout|Grid (2x2)')
close other files: user.vscode("workbench.action.closeOtherEditors")

# terminal focus
term focus: user.vscode("workbench.action.terminal.focus")
term focus one: user.vscode("workbench.action.terminal.focusAtIndex1")
term focus two: user.vscode("workbench.action.terminal.focusAtIndex2")
term focus three: user.vscode("workbench.action.terminal.focusAtIndex3")
term split: user.vscode("workbench.action.terminal.split")
term kill: user.vscode("workbench.action.terminal.kill")

term place bottom:
    user.vscode("workbench.action.positionPanelBottom")
    user.vscode("workbench.action.terminal.focus")
term place right:
    user.vscode("workbench.action.positionPanelRight")
    user.vscode("workbench.action.terminal.focus")
term toggle max:
    user.vscode("workbench.action.toggleMaximizedPanel")
    user.vscode("workbench.action.terminal.focus")
term hide: user.vscode("workbench.action.closePanel")

term scroll up: user.vscode("workbench.action.terminal.scrollUpPage")
term scroll down: user.vscode("workbench.action.terminal.scrollDownPage")
term clear: key(cmd-k)
term here: user.vscode("abraham_utils.openTerminalHere")

# chat
chat focus: user.vscode("roo-cline.SidebarProvider.focus")

# jupyter
cell comment:
    edit.select_all()
    user.vscode("editor.action.commentLine")
cell down: user.vscode("notebook.focusNextEditor")
cell up: user.vscode("notebook.focusPreviousEditor")
cell run up: user.vscode("notebook.cell.executeCellsAbove")
cell run: key(shift-enter)
cell format code: user.vscode("editor.action.changeToCode")
cell format markdown: user.vscode("editor.action.changeToMarkdown")
cell clear output: user.vscode("editor.action.clearOutputs")
cell chuck: user.vscode("notebook.cell.delete")
cell create up: user.vscode("notebook.cell.insertCodeCellAbove")
cell create down: user.vscode("notebook.cell.insertCodeCellBelow")
cell clone up:
    edit.select_all()
    edit.copy()
    user.vscode("notebook.cell.insertCodeCellAbove")
    edit.paste()
cell clone [down]:
    edit.select_all()
    edit.copy()
    user.vscode("notebook.cell.insertCodeCellBelow")
    edit.paste()
cell join up: user.vscode("notebook.cell.joinAbove")
cell join down: user.vscode("notebook.cell.joinBelow")
notebook run$: user.vscode("notebook.execute")
# cell run up: user.vscode("jupyter.runPrecedentCells")
^notebook restart: user.vscode("jupyter.restartkernel")
notebook restart run: user.vscode("jupyter.restartkernelandrunallcells")
notebook kill:
    user.menu_select('File|Save')
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(ctrl-c)
    key(y)
    key(enter)
notebook kernel:
    user.vscode("jupyter.selectKernel")

go conflict:
    user.menu_select('File|Save')
    sleep(200ms)
    user.vscode("abraham_utils.goNextConflict")

# editing actions
select highlights: user.vscode("editor.action.selectHighlights")
clear part: user.vscode("deleteWordPartLeft")
go west part: user.vscode("cursorWordPartLeft")
go east part: user.vscode("cursorWordPartRight")
select part left: user.vscode("cursorWordPartLeftSelect")
select part right: user.vscode("cursorWordPartRightSelect")

go build:
    user.vscode("abraham_utils.goBuildFile")
go sister:
    user.vscode("abraham_utils.toggleHeaderAndSourceFile")

zoom larger:
    user.menu_select('View|Appearance|Zoom In')
zoom smaller:
    user.menu_select('View|Appearance|Zoom Out')
zoom reset:
    user.menu_select('View|Appearance|Reset Zoom [⌘NumPad0]')

save pi cat out:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(cmd-a)
    sleep(500ms)
    key(cmd-c)
    sleep(500ms)
    "pbpaste > /tmp/python_catalyst_output.txt;\n"

diff pi cat out:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    key(cmd-a)
    sleep(500ms)
    key(cmd-c)
    sleep(500ms)
    "pbpaste > /tmp/python_catalyst_output.txt; diff_python_catalyst_output /tmp/python_catalyst_output.txt\n"

diff pi cat last out:
    user.vscode("workbench.action.terminal.focus")
    sleep(500ms)
    "diff_python_catalyst_output /tmp/python_catalyst_output.txt\n"

space {user.vscode_spaces}:
    user.open_vscode_space(vscode_spaces)



(except | accept) <user.cursorless_target>:
    user.cursorless_vscode_command("abraham_utils.acceptConflictSide", cursorless_target)

reject <user.cursorless_target>:
    user.cursorless_vscode_command("abraham_utils.rejectConflictSide", cursorless_target)

(except | accept) both <user.cursorless_target>:
    user.cursorless_vscode_command("abraham_utils.acceptBothSides", cursorless_target)

reject both <user.cursorless_target>:
    user.cursorless_vscode_command("abraham_utils.rejectBothSides", cursorless_target)
