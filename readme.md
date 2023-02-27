# welcome doc learn fbc 1
software doc learn fbc 1 microsoft freebasic language

```freebasic
'.
'├── bbl.bas
'├── doc-learn-fbc1.bas
'├── doc-learn-fbc1.bi
'├── doc-learn-fbc1.wfbe
'├── libdoc-learn-fbc1.a
'├── license
'├── manifest.xml
'├── matrix
'│   └── gnu
'│       ├── bin
'│       │   ├── bbl.bas
'│       │   ├── doc-learn-fbc1.bas
'│       │   ├── npd.bas
'│       │   └── rbc.bas
'│       ├── header
'│       │   └── doc-learn-fbc1.bi
'│       ├── lib
'│       │   └── libdoc-learn-fbc1.a
'│       └── test
'│           └── resource.rc
'├── npd.bas
'├── rbc.bas
'├── readme.md
'└── resource.rc -->
```

DIM
Declares a variable

Syntax:
Dim [Shared] name1 As DataType [, name2 As DataType, ...]
or
Dim [Shared] As DataType name1 [, name2, ...]

Arrays:
Dim name ( [lbound To] ubound [, ...] ) As DataType
Dim name ( Any [, Any...] ) As DataType
Dim name ( ) As DataType

Initializers:
Dim scalar_symbol As DataType = expression | Any
Dim array_symbol (arraybounds) As DataType = { expression [, ...] } | Any
Dim udt_symbol As DataType = ( expression [, ...] ) | Any

Description:
Declares a variable by name and reserves memory to accommodate it.

Variables must be declared before they can be used in the -lang fb dialect or when using Option Explicit in the other dialects. Only in the -lang qb and -lang fblite dialects variables may be used without first declaring them, in such a case they are called implicit variables.

Dim can be used to declare and assign variables of any of the supported data types, user defined types, or enumerations.

Depending on where and how a variable or array is declared can change how it is allocated in memory. See Storage Classes.

More than one variable may be declared in a single Dim statement by separating each variable declaration with a comma.

```freebasic
'' Variable declaration examples

'' One variable per DIM statement
Dim text As String
Dim x As Double

'' More than one variable declared, different data types
Dim k As Single, factor As Double, s As String

'' More than one variable declared, all same data types
Dim As Integer mx, my, mz ,mb

'' Variable having an initializer
Dim px As Double Ptr = @x
```

Explicit Variables with Implicit Data Types
In the -lang qb and -lang fblite dialects, even if the variable is declared explicitly, it will be given a default data type if the data type is not explicitly given either by name or by type suffix. The default data type is Single in the -lang qb dialect and Integer in the -lang fblite dialect. The default data type can be changed throughout a source listing by use of the Def### statements. (for example, DefInt, DefStr, DefSng)

```freebasic
'' Compile with -lang qb

'$lang: "qb"

'' All variables beginning with A through N will default to the INTEGER data type
'' All other variables default to the SINGLE data type
DefInt I-N

Dim I, J, X, Y, T$, D As Double
'' I and J are INTEGERs
'' X and Y are SINGLEs
'' T$ is STRING
'' D is DOUBLE
```

Arrays
As with most BASIC dialects, FreeBASIC supports arrays with indexes ranging from a lower bound to an upper bound. In the syntaxes shown, lbound refers to the lower bound, or the smallest index. ubound refers to the upper bound, or the largest index. If a lower bound is not specified, it is assumed to be zero by default, unless Option Base is used.

```freebasic
Const upperbound = 10

'' Declare an array with indexes ranging from 0 to upperbound,
'' for a total of (upperbound + 1) indexes.
Dim array(upperbound) As Single
```

Multidimensional arrays can be declared as well, and are stored in this definite order: values differing only in the last index are contiguous (row-major order).
The maximum number of dimensions of a multidimensional array is 8.

```python
'' declare a three-dimensional array of single
'' precision floating-point numbers.
Dim array(1 To 2, 6, 3 To 5) As Single

'' The first dimension of the declared array
'' has indices from 1 to 2, the second, 0 to 6,
'' and the third, 3 to 5.
```
For more information on arrays see Arrays Overview.

If the values used with Dim to declare the dimensions of an array are all constants, the array will be created fixed length (of Static size, unless Option Dynamic is specified), while using one or more variables to declare the dimensions of an array makes it variable length, even if Option Static is in effect.

Arrays can be declared as variable length in several ways: Using Dim with an empty set of indexes (Dim x()), using Dim with indexes that are variables or using the keyword Redim, or using Any in place of the array bounds, or declaring it past the metacommand $Dynamic. Variable length arrays can't use initializers.

Arrays declared with Dim having constant indexes and not preceeded by Option Dynamic are fixed length (not resizable at runtime) and can use initializers.

The upper bound can be an ellipsis (..., 3 dots). This will cause to upper bound to be set automatically based on the number of elements found in the initializer. When ellipsis is used in this manner, an initializer must be used, and it may not be Any. See the Ellipsis page for a short example.

See also Fixed-Length Arrays and Variable-Length Arrays.

Initializers
Arrays, variables, strings, and user defined types (UDTs) are initialized to zero (or False for Boolean) or null strings by default when they are created.

To avoid the overhead of default variable initialization, the Any initializer can be used with Dim to tell the compiler to only reserve the place for the variable in memory but not initialize it, so the variable will contain garbage. In this case the programmer should not make assumptions about the initial values.

Fixed-length arrays, variables, zstrings and UDTs may be given a value at the time of their declaration by following the variable declaration with an initializer. Arrays, variables and UDTs are initialized as they would in a normal assignment, using an equal ( = ) sign. The => sign can also be used, allowing to avoid the declaration resembling an expression for example when declaring fixed length strings.

Array values are given in comma-delimited values enclosed by curly brackets, and UDT values are given in comma delimited values enclosed by parenthesis. These methods of initializing variables can be nested within one another for complex assignments. Nesting allows for arrays of any dimension to be initialized.

```freebasic
'' Declare an array of 2 by 5 elements
'' and initialize
Dim array(1 To 2, 1 To 5) As Integer => {{1, 2, 3, 4, 5}, {1, 2, 3, 4, 5}}

'' declare a simple UDT
Type mytype
    var1 As Double
    var2 As Integer
End Type

'' declare a 3 element array and initialize the first
'' 2 mytype elements
Dim myvar(0 To 2) As mytype => {(1.0, 1), (2.0, 2)}
```
For module-level, fixed-length, or global variables, initialized values must be constant expressions. FreeBASIC will report a compile-time error if otherwise.

Note: Initializing UDT's with strings is not supported at this time. Initializing UDT containing data-field initializer or string is not valid. Initializing UDT derived directly or indirectly from the the built-in Object type is not valid.

Explicit Variables with Type Suffixes
In the -lang qb and -lang fblite dialects, the data type of a variable may be indicated with a type suffix ( $ % # ! & ).

```freebasic
'' Compile with -lang qb or fblite

'$lang: "qb"

'' A string variable using the $ type suffix
Dim strVariable$

'' An integer variable using the % type suffix
Dim intVariable%

'' A long variable using the & type suffix
Dim lngVariable&

'' A single precision floating point variable using the ! type suffix
Dim sngVariable!

'' A double precision floating point variable using the # type suffix
Dim dblVariable#

```

Examples:

```freebasic
Dim a As Byte
Dim b As Short
Dim c As Integer
Dim d As LongInt
Dim au As UByte
Dim bu As UShort
Dim cu As UInteger
Dim du As ULongInt
Dim e As Single
Dim f As Double
Dim g As Integer Ptr
Dim h As Byte Ptr
Dim s1 As String * 10   '' fixed length string
Dim s2 As String        '' variable length string
Dim s3 As ZString Ptr   '' zstring

s1 = "Hello World!"
s2 = "Hello World from FreeBASIC!"
s3 = Allocate( Len( s2 ) + 1 )
*s3 = s2

Print "Byte: "; Len(a)
Print "Short: "; Len(b)
Print "Integer: "; Len(c)
Print "Longint: "; Len(d)
Print "UByte: "; Len(au)
Print "UShort: "; Len(bu)
Print "UInteger: "; Len(cu)
Print "ULongint: "; Len(du)
Print "Single: "; Len(e)
Print "Double: "; Len(f)
Print "Integer Pointer: "; Len(g)
Print "Byte Pointer: "; Len(h)
Print "Fixed String: "; Len(s1)
Print "Variable String: "; Len(s2)
Print "ZString: "; Len(*s3)

Deallocate(s3)

```

Dialect Differences:

    In the -lang qb and -lang fblite dialects, variables have procedure scope if the variable is defined inside a procedure, and for the entire module if the variable is defined with Dim Shared.
    In the -lang qb dialect, variables cannot be initialised. In the -lang fblite dialect, the variable is initialised with a default value at the start of the procedure/module, and assigned its initial value if/when the Dim statement is executed at runtime.
    In the -lang fb and -lang deprecated dialects, variables declared inside compound block statements (For..Next, While..Wend, Do..Loop, If..Then, Select..End Select, With..End With, Scope..End Scope) have local working scopes, and are visible only within these blocks. To access duplicated symbols defined as global outside these blocks, add one or preferably two dot(s) as prefix: .SomeSymbol or preferably ..SomeSymbol (or only ..SomeSymbol if inside a With..End With block).
    In the -lang fb dialect, Option statements (e.g. Option Base, Option Dynamic), metacommand(e.g. $Static) and Def### statements (e.g. DefInt) are not allowed.


Differences from QB:

    Variable Initializers are new to FreeBASIC.
    The alternate syntax Dim As DataType symbolname, [...] is new to FreeBASIC.
    Multidimensional arrays are stored in this definite order: values differing only in the last index are contiguous (row-major order), they were stored in opposite order in QB by default: values differing only in the first index were contiguous (column-major order).
    Variable length arrays up to 2 GiB in size are possible in FreeBASIC. In QB, $STATIC arrays were limited to 64 KiB , or to the DOS memory available (several 100 KiB at best) if made $DYNAMIC and /AH was used.
    The ellipsis form for upper bounds is new to FreeBASIC.


See also:

    Var
    Common
    Extern
    Redim
    Preserve
    Shared
    Static
    Byref (variables)
    Erase
    LBound
    UBound
    ... (Ellipsis)
    Any
    Pointers to Procedures
