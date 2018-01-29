" program keywords

syntax keyword  javaScriptIdentifier          const let this undefined var void yield

syntax keyword  javaScriptSource              import export from
highlight link  javaScriptSource              Identifier

syntax keyword  javaScriptKeywordExtends      extends
highlight link  javaScriptKeywordExtends      Identifier

syntax keyword  javaScriptKeywordClass        class
highlight link  javaScriptKeywordClass        Constant

" ==============================================================================
" braces

" highlight link javaScriptBraces               Normal

" string: template literal
syntax match    javaScriptTemplateDelimiter   "\${\|}" contained
syntax region   javaScriptTemplateVar         start=+${+ end=+}+                    contains=javaScriptTemplateDelimiter keepend
syntax region   javaScriptTemplateString      start=+`+ skip=+\\\(`\|$\)+ end=+`+   contains=javaScriptTemplateVar keepend
highlight link  javaScriptTemplateDelimiter   Constant
highlight link  javaScriptTemplateVar         String
highlight link  javaScriptTemplateString      String

" ==============================================================================
" arrow function

syntax match    javaScriptArrowFunction       /=>/                skipwhite skipempty
syntax match    javaScriptArrowFunction       /\<\K\k*\ze\s*=>/   skipwhite skipempty nextgroup=javaScriptArrowFunction extend
syntax match    javaScriptArrowFunction       /([^()]*)\ze\s*=>/  skipwhite skipempty nextgroup=javaScriptArrowFunction extend
highlight link  javaScriptArrowFunction       Function

