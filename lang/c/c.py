from talon import Context, Module, actions, settings

mod = Module()

ctx = Context()
ctx.matches = r"""
code.language: c
code.language: cpp
"""

ctx.lists["self.c_preproc"] = {
    "define": "define",
    "if def": "ifdef",
    "include": "include"
}

ctx.lists["self.c_streams"] = {
    "standard out": "std::out",
}

ctx.lists["self.c_operators"] = {
    "times": "*",
    "divide": "/",
    "add": "+",
    "subtract": "-",
    "left shift": "<<",
    "right shift": ">>",
}


ctx.lists["self.c_keywords"] = {
    "static": "static",
    "volatile": "volatile",
    "typedef": "typedef",
    "for": "for",
    "while": "while"
}

ctx.lists['self.c_statements'] = {
    "continue": "continue",
    "break": "break",
    "return": "return",
}


ctx.lists["self.c_types"] = {
    "byte": "uint8_t",
    "char": "char",
    "short": "short",
    "long": "long",
    "int": "int",
    "integer": "int",
    "void": "void",
    "double": "double",
    "struct": "struct",
    "struck": "struct",
    "num": "enum",
    "union": "union",
    "float": "float",
    "auto": "auto",
    "size":"size_t",
    "standard string":"std::string",
    "bool":"bool",
    "standard list": "std::list",
    "standard vector": "std::vector",
    "standard map": "std::map",
}


ctx.lists["user.c_functions"] = {
    "mem copy": "memcpy",
    "mem set": "memset",
    "string cat": "strcat",
    "stir cat": "strcat",
    "stir en cat": "strncat",
    "stir elle cat": "strlcat",
    "stir copy": "strcpy",
    "stir en copy": "strncpy",
    "stir elle copy": "strlcpy",
    "string char": "strchr",
    "string dupe": "strdup",
    "stir dupe": "strdup",
    "stir comp": "strcmp",
    "stir en comp": "strncmp",
    "string len": "strlen",
    "stir len": "strlen",
    "is digit": "isdigit",
    "get char": "getchar",
    "print eff": "printf",
    "es print eff": "sprintf",
    "es en print eff": "sprintf",
    "stir to int": "strtoint",
    "stir to unsigned int": "strtouint",
    "ay to eye": "atoi",
    "em map": "mmap",
    "ma map": "mmap",
    "em un map": "munmap",
    "size of": "sizeof",
    "ef open": "fopen",
    "ef write": "fwrite",
    "ef read": "fread",
    "ef close": "fclose",
    "exit": "exit",
    "get op": "getopt",
    "malloc": "malloc",
    "see alloc": "calloc",
    "alloc ah": "alloca",
    "free": "free",
}

mod.list("c_types", desc="Common C types")
mod.list("c_keywords", desc="Common C keywords")
mod.list("c_preproc", desc="Common C preprocessor defs")
mod.list("c_functions", desc="Common C functions")
mod.list("c_statements", desc="Common C statements")
mod.list("c_operators", desc="Common C statements")

mod.list("c_streams", desc="Common C streams")

@mod.capture(rule="{self.c_types}")
def c_types(m) -> str:
    "Returns a string"
    return m.c_types

@mod.capture(rule="{self.c_keywords}")
def c_keywords(m) -> str:
    "Returns a string"
    return m.c_keywords

@mod.capture(rule="{self.c_preproc}")
def c_preproc(m) -> str:
    "Returns a string"
    return m.c_preproc

@mod.capture(rule="{self.c_functions}")
def c_functions(m) -> str:
    "Returns a string"
    return m.c_functions

@mod.capture(rule="{self.c_statements}")
def c_statements(m) -> str:
    "Returns a string"
    return m.c_statements

@mod.capture(rule="{self.c_operators}")
def c_operators(m) -> str:
    "Returns a string"
    return m.c_operators

@mod.capture(rule="{self.c_streams}")
def c_streams(m) -> str:
    "Returns a string"
    return m.c_streams

