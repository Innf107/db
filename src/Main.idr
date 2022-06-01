module Main

import Common

import DB.Syntax
import DB.Types
import DB.Compile

exampleDecls : List Decl
exampleDecls = [
        DefTable "cia" [
            ("Name", StringT)
        ,   ("Region", StringT)
        ,   ("Fläche", DoubleT)
        ,   ("Einwohner", IntT)
        ,   ("BIP", NullableT IntT)
        ]
    ]

exampleQuery : Query Parsed
exampleQuery = Select () ["Name"] (TableRef () "cia")


main : IO ()
main = do
    let (typedDecls, typedQuery) = checkProgram exampleDecls exampleQuery
    putStrLn "test"

