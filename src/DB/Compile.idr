module DB.Compile

import Common

import Data.SortedMap as Map

import DB.Syntax
import RelAlg.Syntax


record CompEnv where
    constructor MkCompEnv
    tables : SortedMap Name (List (Name, Ty))

emptyEnv : CompEnv
emptyEnv = MkCompEnv empty

processDecls : CompEnv -> List Decl -> CompEnv
processDecls env decls = foldr processDecl env decls
    where
        processDecl : Decl -> CompEnv -> CompEnv
        processDecl (DefTable tname fields) env = { tables := Map.insert tname fields env.tables } env 


compileQuery : CompEnv -> Query Typed -> String
compileQuery env (TableRef ty tableName) = "select * from " ++ tableName
compileQuery env (Select ty tableNames query) = ""


export
compile : List Decl -> Query Typed -> String
compile decls query = compileQuery (processDecls emptyEnv decls) query



