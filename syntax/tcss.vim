" Textual CSS syntax highlighting

if exists("b:current_syntax")
  finish
endif

" Comments: // ...
syntax match tcssComment "/\*.*\*/"
highlight link tcssComment Comment

" Braces
syntax match tcssBrace "[{}]"
highlight link tcssBrace Delimiter

" Selectors (Widget names, capitalized identifiers)
syntax match tcssSelector "^[A-Z][A-Za-z0-9_]*"
highlight link tcssSelector Identifier

" Nested selectors (indented)
syntax match tcssSelector "\s\+[A-Z][A-Za-z0-9_]*"
highlight link tcssSelector Identifier

" Properties (lowercase identifiers followed by :)
syntax match tcssProperty "\<[a-z_][a-z0-9_-]*\s*:"
highlight link tcssProperty Type

" Values (after :)
syntax match tcssValue ":\s*[^;{}]\+"
highlight link tcssValue String

" Numbers (fr units, px, %, etc.)
syntax match tcssNumber "\<[0-9]\+\(fr\|px\|%\)\>"
highlight link tcssNumber Number

" Colors (named or hex)
syntax match tcssColor "\<\(red\|blue\|green\|aqua\|yellow\|white\|black\)\>"
syntax match tcssColor "#[0-9A-Fa-f]\{3,6}"
highlight link tcssColor Constant

" Booleans
syntax keyword tcssBoolean true false
highlight link tcssBoolean Boolean

let b:current_syntax = "tcss"
