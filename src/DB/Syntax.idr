module DB.Syntax

import Common

public export
data Ty = IntT
        | StringT
        | DoubleT
        | NullableT Ty
        | TableT Name

public export
data Decl = DefTable Name (List (Name, Ty))

public export
record QueryAnn where
    constructor MkQueryAnn
    XTableRef : Type
    XSelect : Type

public export
data Query : (ann : QueryAnn) -> Type where
    TableRef : ann.XTableRef -> Name -> Query ann
    Select : ann.XSelect -> List Name -> Query ann -> Query ann

public export
Parsed : QueryAnn
Parsed = MkQueryAnn {
        XTableRef = ()
    ,   XSelect = ()
    }
public export
Typed : QueryAnn
Typed = MkQueryAnn {
        XTableRef = Ty
    ,   XSelect = Ty
    }
