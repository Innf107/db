module DB.Compile

import Data.SortedMap as Map

import DB.Syntax


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

compileQuery : CompEnv -> Query -> String
compileQuery env (TableRef tableName) = "select * from " ++ tableName

export
compile : List Decl -> Query -> String
compile decls query = compileQuery (processDecls emptyEnv decls) query



