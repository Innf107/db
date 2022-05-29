module Main

import DB.Syntax
import DB.Compile

exampleDecls : List Decl
exampleDecls = [
        DefTable "cia" [
            ("Name", StringT)
        ,   ("Region", StringT)
        ,   ("Fläche", DoubleT)
        ,   ("Einwohner", IntT)
        ,   ("BIP", Nullable IntT)
        ]
    ]

exampleQuery : Query
exampleQuery = TableRef "cia"


main : IO ()
main = putStrLn (compile exampleDecls exampleQuery)

