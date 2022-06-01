module RelAlg.Syntax

import Common

public export
data Pred : Type

public export
data Expr = Project (List Name)
          | Select (List Pred) Expr


