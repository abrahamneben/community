mode: dictation
mode: command
language: en
-


# Navigation
go up [<user.ordinals>]$:
    number = ordinals or 1
    edit.up()
    repeat(number - 1)
go down [<user.ordinals>]$:
    number = ordinals or 1
    edit.down()
    repeat(number - 1)
go left [<user.ordinals>]$:
    number = ordinals or 1
    edit.left()
    repeat(number - 1)
go right [<user.ordinals>]$:
    number = ordinals or 1
    edit.right()
    repeat(number - 1)
go left word [<user.ordinals>]$:
    number = ordinals or 1
    edit.word_left()
    repeat(number - 1)
go right word [<user.ordinals>]$:
    number = ordinals or 1
    edit.word_right()
    repeat(number - 1)
go line start$: edit.line_start()
go line end$: edit.line_end()

# Selection
select up [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_up()
    repeat(number - 1)
select down [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_down()
    repeat(number - 1)
select left [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_left()
    repeat(number - 1)
select right [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_right()
    repeat(number - 1)

select left word [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_word_left()
    repeat(number - 1)
select right word [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_word_right()
    repeat(number - 1)


# Deletion
clear up [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_up()
    repeat(number - 1)
    edit.delete()
clear down [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_down()
    repeat(number - 1)
    edit.delete()
clear word [<user.ordinals>]$:
    number = ordinals or 1
    edit.delete_word()
    repeat(number - 1)
clear right word [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_word_right()
    repeat(number - 1)
    edit.delete()
clear [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_left()
    repeat(number - 1)
    edit.delete()
clear right [<user.ordinals>]$:
    number = ordinals or 1
    edit.extend_right()
    repeat(number - 1)
    edit.delete()
clear line$:
    edit.extend_line_start()
    edit.delete()

scratch that$:
    edit.undo()