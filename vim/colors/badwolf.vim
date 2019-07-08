" vim: ts=4 et fmr={{{,}}} fdl=0 fdm=marker
"
" Theme BadWold by Steve Losh
" Available at http://stevelosh.com/projects/badwolf/
"
" Modified by me.
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let colors_name = "badwolf"

if !exists("g:badwolf_html_link_underline") " {{{
    let g:badwolf_html_link_underline = 1
endif " }}}

if !exists("g:badwolf_css_props_highlight") " {{{
    let g:badwolf_css_props_highlight = 0
endif " }}}

" }}}
" Palette {{{

let s:bwc = {}

" Normal text.
let s:bwc.plain = ['f8f6f2', 15]

" Pure and simple.
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

" All of the Gravel colors
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['121212', 233]
let s:bwc.blackestgravel = ['0c0c0c', 232]

" Highlighting
let s:bwc.dalespale = ['fade3e', 221]

" eg. Strings
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Keywords
let s:bwc.taffy = ['c70e0e', 196]

" Blue lines
let s:bwc.tardis = ['0a9dff', 39]
let s:bwc.darktardis = ['007aca', 38]

let s:bwc.orange = ['ffa724', 214]
let s:bwc.saltwatertaffy = ['8cffba', 121]

" eg. Arguments
let s:bwc.lime = ['aeee00', 154]

" eg. Warnings
let s:bwc.dress = ['ff9eb8', 211]

" eg. Numbers
let s:bwc.toffee = ['b88853', 137]

let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}
" Configuration Options {{{

if exists('g:badwolf_darkgutter') && g:badwolf_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

if exists('g:badwolf_tabline')
    if g:badwolf_tabline == 0
        let s:tabline = 'blackestgravel'
    elseif  g:badwolf_tabline == 1
        let s:tabline = 'blackgravel'
    elseif  g:badwolf_tabline == 2
        let s:tabline = 'darkgravel'
    elseif  g:badwolf_tabline == 3
        let s:tabline = 'deepgravel'
    else
        let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif

" }}}
" Vanilla Vim {{{
" General/UI {{{

call s:HL('Normal', 'plain', 'blackgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  '', 'darkgravel')

call s:HL('TabLine', 'plain', s:tabline, 'none')
call s:HL('TabLineFill', 'plain', s:tabline, 'none')
call s:HL('TabLineSel', 'coal', 'tardis', 'none')

call s:HL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'coal', 'dalespale', 'bold')
call s:HL('IncSearch', 'coal', 'tardis',    'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'coal', 'tardis',     'bold')
call s:HL('StatusLineNC', 'snow', 'deepgravel', 'bold')

call s:HL('Directory', 'dirtyblonde', '', 'bold')

call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'dalespale',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'dress',       '',   'bold')

" This is a ctags tag, not an HTML one. 'Something you can use c-] on'.
call s:HL('Tag', '', '', 'bold')

call s:HL('User1', 'coal', 'tardis', 'bold')
call s:HL('User2', 'coal', 'orange', 'bold')
call s:HL('User3', 'coal', 'darktardis', 'bold')


" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumgravel', s:gutter)
call s:HL('SignColumn', '',             s:gutter)
call s:HL('FoldColumn', 'mediumgravel', s:gutter)

" }}}
" Cursor {{{

call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call s:HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'gravel')
call s:HL('Todo',           'snow', 'bg', 'bold')
call s:HL('SpecialComment', 'snow', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call s:HL('String', 'dirtyblonde')

" Control flow stuff is taffy.
call s:HL('Statement',   'taffy', '', 'bold')
call s:HL('Keyword',     'taffy', '', 'bold')
call s:HL('Conditional', 'taffy', '', 'bold')
call s:HL('Operator',    'taffy', '', 'none')
call s:HL('Label',       'taffy', '', 'none')
call s:HL('Repeat',      'taffy', '', 'none')

" Functions and variable declarations are orange, because plain looks weird.
call s:HL('Identifier', 'orange', '', 'none')
call s:HL('Function',   'orange', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call s:HL('PreProc',   'lime', '', 'none')
call s:HL('Macro',     'lime', '', 'none')
call s:HL('Define',    'lime', '', 'none')
call s:HL('PreCondit', 'lime', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call s:HL('Constant',  'toffee', '', 'bold')
call s:HL('Character', 'toffee', '', 'bold')
call s:HL('Boolean',   'toffee', '', 'bold')

call s:HL('Number', 'toffee', '', 'bold')
call s:HL('Float',  'toffee', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call s:HL('SpecialChar', 'dress', '', 'bold')

call s:HL('Type', 'dress', '', 'none')
call s:HL('StorageClass', 'taffy', '', 'none')
call s:HL('Structure', 'taffy', '', 'none')
call s:HL('Typedef', 'taffy', '', 'bold')

" Make try/catch blocks stand out.
call s:HL('Exception', 'lime', '', 'bold')

" Misc
call s:HL('Error',  'snow',   'taffy', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call s:HL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call s:HL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call s:HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call s:HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}
" }}}
" Plugins {{{
" Rainbow Parentheses {{{
" call s:HL('level16c', 'mediumgravel',   '', 'bold')
" call s:HL('level15c', 'dalespale',      '', '')
" call s:HL('level14c', 'dress',          '', '')
" call s:HL('level13c', 'orange',         '', '')
" call s:HL('level12c', 'tardis',         '', '')
" call s:HL('level11c', 'lime',           '', '')
" call s:HL('level10c', 'toffee',         '', '')
" call s:HL('level9c',  'saltwatertaffy', '', '')
" call s:HL('level8c',  'coffee',         '', '')
" call s:HL('level7c',  'dalespale',      '', '')
" call s:HL('level6c',  'dress',          '', '')
" call s:HL('level5c',  'orange',         '', '')
" call s:HL('level4c',  'tardis',         '', '')
" call s:HL('level3c',  'lime',           '', '')
" call s:HL('level2c',  'toffee',         '', '')
" call s:HL('level1c',  'saltwatertaffy', '', '')
" }}}
" }}}
" " Filetype-specific {{{
" " CSS {{{
"
" if g:badwolf_css_props_highlight
"     call s:HL('cssColorProp', 'dirtyblonde', '', 'none')
"     call s:HL('cssBoxProp', 'dirtyblonde', '', 'none')
"     call s:HL('cssTextProp', 'dirtyblonde', '', 'none')
"     call s:HL('cssRenderProp', 'dirtyblonde', '', 'none')
"     call s:HL('cssGeneratedContentProp', 'dirtyblonde', '', 'none')
" else
"     call s:HL('cssColorProp', 'fg', '', 'none')
"     call s:HL('cssBoxProp', 'fg', '', 'none')
"     call s:HL('cssTextProp', 'fg', '', 'none')
"     call s:HL('cssRenderProp', 'fg', '', 'none')
"     call s:HL('cssGeneratedContentProp', 'fg', '', 'none')
" end
"
" call s:HL('cssValueLength', 'toffee', '', 'bold')
" call s:HL('cssColor', 'toffee', '', 'bold')
" call s:HL('cssBraces', 'lightgravel', '', 'none')
" call s:HL('cssIdentifier', 'orange', '', 'bold')
" call s:HL('cssClassName', 'orange', '', 'none')
" " }}}
" " Javascript {{{
"
" call s:HL('typescriptImport', 'taffy', '', 'bold')
" call s:HL('typescriptCastKeyword', 'taffy', '', 'bold')
" call s:HL('typescriptExport', 'taffy', '', 'bold')
" call s:HL('typescriptMember', 'plain', '', '')
" call s:HL('typescriptObjectLabel', 'plain', '', '')
"
" " }}}
" " Diff {{{
"
" call s:HL('gitDiff', 'lightgravel', '',)
"
" call s:HL('diffRemoved', 'dress', '',)
" call s:HL('diffAdded', 'lime', '',)
" call s:HL('diffFile', 'coal', 'taffy', 'bold')
" call s:HL('diffNewFile', 'coal', 'taffy', 'bold')
"
" call s:HL('diffLine', 'coal', 'orange', 'bold')
" call s:HL('diffSubname', 'orange', '', 'none')
"
" " }}}
" " HTML {{{
"
" " Punctuation
" call s:HL('htmlTag',    'darkroast', 'bg', 'none')
" call s:HL('htmlEndTag', 'darkroast', 'bg', 'none')
"
" " Tag names
" call s:HL('htmlTagName',        'coffee', '', 'bold')
" call s:HL('htmlSpecialTagName', 'coffee', '', 'bold')
" call s:HL('htmlSpecialChar',    'lime',   '', 'none')
"
" " Attributes
" call s:HL('htmlArg', 'coffee', '', 'none')
"
" " Stuff inside an <a> tag
"
" if g:badwolf_html_link_underline
"     call s:HL('htmlLink', 'lightgravel', '', 'underline')
" else
"     call s:HL('htmlLink', 'lightgravel', '', 'none')
" endif
"
" " }}}
" " Java {{{
"
" call s:HL('javaClassDecl', 'taffy', '', 'bold')
" call s:HL('javaScopeDecl', 'taffy', '', 'bold')
" call s:HL('javaCommentTitle', 'gravel', '')
" call s:HL('javaDocTags', 'snow', '', 'none')
" call s:HL('javaDocParam', 'dalespale', '', '')
"
" " }}}
" " LaTeX {{{
"
" call s:HL('texStatement', 'tardis', '', 'none')
" call s:HL('texMathZoneX', 'orange', '', 'none')
" call s:HL('texMathZoneA', 'orange', '', 'none')
" call s:HL('texMathZoneB', 'orange', '', 'none')
" call s:HL('texMathZoneC', 'orange', '', 'none')
" call s:HL('texMathZoneD', 'orange', '', 'none')
" call s:HL('texMathZoneE', 'orange', '', 'none')
" call s:HL('texMathZoneV', 'orange', '', 'none')
" call s:HL('texMathZoneX', 'orange', '', 'none')
" call s:HL('texMath', 'orange', '', 'none')
" call s:HL('texMathMatcher', 'orange', '', 'none')
" call s:HL('texRefLabel', 'dirtyblonde', '', 'none')
" call s:HL('texRefZone', 'lime', '', 'none')
" call s:HL('texComment', 'darkroast', '', 'none')
" call s:HL('texDelimiter', 'orange', '', 'none')
" call s:HL('texZone', 'brightgravel', '', 'none')
"
" augroup badwolf_tex
"     au!
"     au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
"     au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
" augroup end
"
" " }}}
" " Markdown {{{
"
" call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
" call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
" call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
" call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
" call s:HL('markdownItalic', 'snow', '', 'bold')
" call s:HL('markdownBold', 'snow', '', 'bold')
" call s:HL('markdownH1', 'orange', '', 'bold')
" call s:HL('markdownH2', 'lime', '', 'bold')
" call s:HL('markdownH3', 'lime', '', 'none')
" call s:HL('markdownH4', 'lime', '', 'none')
" call s:HL('markdownH5', 'lime', '', 'none')
" call s:HL('markdownH6', 'lime', '', 'none')
" call s:HL('markdownLinkText', 'toffee', '', 'underline')
" call s:HL('markdownIdDeclaration', 'toffee')
" call s:HL('markdownAutomaticLink', 'toffee', '', 'bold')
" call s:HL('markdownUrl', 'toffee', '', 'bold')
" call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
" call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
" call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
" call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
" call s:HL('markdownCode', 'dirtyblonde', '', 'none')
" call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')
"
" " }}}
" " MySQL {{{
"
" call s:HL('mysqlSpecial', 'dress', '', 'bold')
"
" " }}}
" " Python {{{
"
" hi def link pythonOperator Operator
" call s:HL('pythonBuiltin',     'dress')
" call s:HL('pythonBuiltinObj',  'dress')
" call s:HL('pythonBuiltinFunc', 'dress')
" call s:HL('pythonEscape',      'dress')
" call s:HL('pythonException',   'lime', '', 'bold')
" call s:HL('pythonExceptions',  'lime', '', 'none')
" call s:HL('pythonPrecondit',   'lime', '', 'none')
" call s:HL('pythonDecorator',   'taffy', '', 'none')
" call s:HL('pythonRun',         'gravel', '', 'bold')
" call s:HL('pythonCoding',      'gravel', '', 'bold')
"
" " }}}
" " SLIMV {{{
"
" " Rainbow parentheses
" " call s:HL('hlLevel0', 'gravel')
" " call s:HL('hlLevel1', 'orange')
" " call s:HL('hlLevel2', 'saltwatertaffy')
" " call s:HL('hlLevel3', 'dress')
" " call s:HL('hlLevel4', 'coffee')
" " call s:HL('hlLevel5', 'dirtyblonde')
" " call s:HL('hlLevel6', 'orange')
" " call s:HL('hlLevel7', 'saltwatertaffy')
" " call s:HL('hlLevel8', 'dress')
" " call s:HL('hlLevel9', 'coffee')
"
" " }}}
" " Vim {{{
"
" call s:HL('VimCommentTitle', 'lightgravel', '', 'bold')
"
" call s:HL('VimMapMod',    'dress', '', 'none')
" call s:HL('VimMapModKey', 'dress', '', 'none')
" call s:HL('VimNotation', 'dress', '', 'none')
" call s:HL('VimBracket', 'dress', '', 'none')
"
" " }}}
" " }}}