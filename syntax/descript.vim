" Syntax file for doomsday engine's scripting language,
" doomsday script.
" 
" Language: doomsday script
" Maintainer: Roman Hargrave

if exists("b:current_syntax")
    finish
endif

" Expressions
syn match       deName          '[a-zA-Z][a-zA-Z1-9]*'
syn cluster     deExpression    contains=deName,deCallSep,deAssign,deOperators 

" Reserved words and functions
syn keyword     deConstant      True False None Pi
syn keyword     deStatement     del export return print end
syn keyword     deStatement     def record nextgroup=deName skipwhite 
syn keyword     deStatement     const nextgroup=deName nextgroup=deExpression skipwhite 
syn keyword     deException     try catch throw
syn keyword     deConditional   if else elsif 
syn keyword     deIteration     for while in break continue
syn keyword     deOperator      and or not 
syn keyword     deImport        import 

" Builtin functions
syn keyword     deBuiltin       locals 
syn keyword     deBuiltin       len dictkeys dictvalues
syn keyword     deBuiltin       Text Number Time timedelta
syn keyword     deBuiltin       serialize deserialize

" String literals
syn region      deString        start="'"   end="'"     contains=@Spell skipnl 
syn region      deString        start='"'   end='"'     contains=@Spell skipnl
syn region      deString        start='"""' end='"""'   contains=@Spell 

" Number literals (shamelessly taken from the ruby syntax definition)
syn match       deInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								                                display
syn match       deInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						                    display
syn match       deInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								                            display
syn match       deInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								                            display
syn match       deFloat	        "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					                    display
syn match       deFloat	        "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display

" Array literals (also yanked from ruby syntax definition)
syn region      deArray	        matchgroup=deArrayDelimiter start="\%(\w\|[\]})]\)\@<!\[" end="]"  fold

" Comments
syn keyword     deTodo          FIXME NOTES NOTE TODO XXX contained 
syn match       deComment       "#.*$" contains=deTodo,@Spell 

" Lexical scopes
syn region      deBlock         start="\<def\>"     end="\<end\>"   fold transparent
syn region      deBlock         start="\<if\>"      end="\<end\>"   fold transparent 
syn region      deBlock         start="\<while\>"   end="\<end\>"   fold transparent
syn region      deBlock         start="\<for\>"     end="\<end\>"   fold transparent 
syn region      deBlock         start="\<try\>"     end="\<end\>"   fold transparent 

" Highlighter links

command -nargs=+ HLink hi def link <args>

HLink deConstant        Constant
HLink deStatement       Statement
HLink deConditional     Conditional
HLink deIteration       Repeat
HLink deOperator        Operator
HLink deException       Exception
HLink deComment         Comment 
HLink deImport          Include 
HLink deBuiltin         Function

HLink deTodo            Todo 
HLink deString          String 
HLink deInteger         Number 
HLink deFloat           Number 

delcommand HLink

let b:current_syntax = "doomsday-script"
