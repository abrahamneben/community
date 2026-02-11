mode: command
language: en
-


# Navigation
go north [<number_small> times]$:
    number_small = number_small or 1
    edit.up()
    repeat(number_small - 1)
go south [<number_small> times]$:
    number_small = number_small or 1
    edit.down()
    repeat(number_small - 1)
go west [<number_small> times]$:
    number_small = number_small or 1
    edit.left()
    repeat(number_small - 1)
go east [<number_small> times]$:
    number_small = number_small or 1
    edit.right()
    repeat(number_small - 1)
go (west word | westward) [<number_small> times]$:
    number_small = number_small or 1
    edit.word_left()
    repeat(number_small - 1)
go (east word | eastward) [<number_small> times]$:
    number_small = number_small or 1
    edit.word_right()
    repeat(number_small - 1)
go west end$: edit.line_start()
go east end$: edit.line_end()

# Selection
seleck north [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_up()
    repeat(number_small - 1)
seleck south [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_down()
    repeat(number_small - 1)
seleck west [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_left()
    repeat(number_small - 1)
seleck east [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_right()
    repeat(number_small - 1)

seleck (west word | westward) [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_word_left()
    repeat(number_small - 1)
seleck (east word | eastward) [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_word_right()
    repeat(number_small - 1)


# Deletion
clear up [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_up()
    repeat(number_small - 1)
    edit.delete()
clear down [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_down()
    repeat(number_small - 1)
    edit.delete()
clear word [<number_small> times]$:
    number_small = number_small or 1
    edit.delete_word()
    repeat(number_small - 1)
clear right word [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_word_right()
    repeat(number_small - 1)
    edit.delete()
clear [<number_small> times]$:
    number_small = number_small or 1
    edit.delete()
    repeat(number_small - 1)
clear right [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_right()
    repeat(number_small - 1)
    edit.delete()
clear line$:
    edit.extend_line_start()
    edit.delete()

nope that$:
    edit.undo()