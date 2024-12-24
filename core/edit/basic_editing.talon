mode: dictation
mode: command
language: en
-


# Navigation
go up [<number_small> times]$:
    number_small = number_small or 1
    edit.up()
    repeat(number_small - 1)
go down [<number_small> times]$:
    number_small = number_small or 1
    edit.down()
    repeat(number_small - 1)
go left [<number_small> times]$:
    number_small = number_small or 1
    edit.left()
    repeat(number_small - 1)
go right [<number_small> times]$:
    number_small = number_small or 1
    edit.right()
    repeat(number_small - 1)
go left word [<number_small> times]$:
    number_small = number_small or 1
    edit.word_left()
    repeat(number_small - 1)
go right word [<number_small> times]$:
    number_small = number_small or 1
    edit.word_right()
    repeat(number_small - 1)
go line start$: edit.line_start()
go line end$: edit.line_end()

# Selection
select up [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_up()
    repeat(number_small - 1)
select down [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_down()
    repeat(number_small - 1)
select left [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_left()
    repeat(number_small - 1)
select right [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_right()
    repeat(number_small - 1)

select left word [<number_small> times]$:
    number_small = number_small or 1
    edit.extend_word_left()
    repeat(number_small - 1)
select right word [<number_small> times]$:
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

scratch that$:
    edit.undo()