module DB.Types

import Common

import Data.SortedMap

import DB.Syntax

record TCEnv where
    constructor MkTCEnv
    varTypes : SortedMap Name Ty

checkDecl : TCEnv -> Decl -> (Decl, TCEnv)
checkDecl = ?cd

export
checkProgram : List Decl -> Query Parsed -> (List Decl, Query Typed)
checkProgram = ?cp

