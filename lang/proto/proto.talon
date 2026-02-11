code.language: protobuf
-

push braces:
    insert("{")
    key(enter)

push message: "message "
state package: "package "
state reserved: "reserved "
state enum: "enum "
op equals: " = "
state import: "import "
state import public: "import public "
state option: "option "
state repeated: "repeated "
type int thirty two: "int32 "
type bool: "bool "

type {user.code_type}: "{code_type}"
repeated type {user.code_type}: "repeated {code_type}"

push comment: "// "
push gets: "= "
push var bool: "bool "