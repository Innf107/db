module DB.Syntax

public export
Name : Type
Name = String

public export
data Ty = IntT
        | StringT
        | DoubleT
        | Nullable Ty
        | Table Name

public export
data Decl = DefTable Name (List (Name, Ty))

public export
data Query = TableRef Name
