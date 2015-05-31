" Syntax file for doomsday engine's scripting language,
" doomsday script.
" 
" Language: doomsday script
" Maintainer: Roman Hargrave

if exists("b:current_syntax")
    finish
endif

" Operators
syn keyword     dedCopy         copy * nextgroup=dedType
syn keyword     dedInclude      include 

" Types
syn keyword     dedType         Decoration Detail Flag Group Header Text Values Episode     nextgroup=dedBlock 
syn keyword     dedType         Line Sector Map Light Generator                             nextgroup=dedBlock 
syn keyword     dedType         State Thing Material Model Sprite Sky Reflection            nextgroup=dedBlock 
syn keyword     dedType         Music Sound Finale                                          nextgroup=dedBlock 
syn keyword     dedType         InFine Script                                               nextgroup=dedBlock 
syn match       dedType         "Texture Environment"                                       nextgroup=dedBlock

" Schemas
syn keyword     dedSchema       flats: textures: contained 

" Label syntax
syn match       dedLabel        '[A-Za-z][A-Za-z0-9\s]*'

" String literals
syn region      dedString        start='"'   end='"'     contains=@Spell,dedSchema skipnl

" Number literals (shamelessly taken from the ruby syntax definition)
syn match       dedInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[xX]\x\+\%(_\x\+\)*\>"								                                display
syn match       dedInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0[dD]\)\=\%(0\|[1-9]\d*\%(_\d\+\)*\)\>"						                    display
syn match       dedInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[oO]\=\o\+\%(_\o\+\)*\>"								                            display
syn match       dedInteger	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<0[bB][01]\+\%(_[01]\+\)*\>"								                            display
syn match       dedFloat	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\.\d\+\%(_\d\+\)*\>"					                    display
syn match       dedFloat	    "\%(\%(\w\|[]})\"']\s*\)\@<!-\)\=\<\%(0\|[1-9]\d*\%(_\d\+\)*\)\%(\.\d\+\%(_\d\+\)*\)\=\%([eE][-+]\=\d\+\%(_\d\+\)*\)\>"	display

" Blocks
syn region      dedBlock        start='{' end='}' transparent fold 

" Comments
syn keyword     dedTodo         FIXME NOTES NOTE TODO XXX contained 
syn match       dedComment      "#[^\n]*$" contains=deTodo,@Spell 
syn match       dedComment      "#>.*<#" contains=deTodo,@Spell 

" Highlighter links

command -nargs=+ HLink hi def link <args>

HLink dedCopy           Operator
HLink dedInclude        Include 

HLink dedComment        Comment

HLink dedString         String 
HLink dedInteger        Number 
HLink dedFloat          Number 

HLink dedType           Builtin

HLink dedSchema         Identifier 
HLink dedLabel          Identifier 

delcommand HLink

let b:current_syntax = "doomsday-defs"
