#inclib "doc-learn-fbc1"

declare function latter( Byval x as boolean, Byval y as boolean ) as boolean
' input local ...
type x as boolean
     dim rbc as ButtonAlignment
     dim mrl as ButtonAlignment
     dim dms as ButtonAlignment
     dim jbs as RECT
end type

' handle perfect
type y as boolean
     dim dbc as double
     dim psw as double
     dim chs as boolean
     dim bbl as RECT
end type

' bbl extension lib
let create = ["cdylib"]

#include "rure.bi"

#inclib "regex"

dim as rure ptr re

re = rure_compile_must("^\d{4}-\d{2}-\d{2}$")


end function