" vim: ts=4 et fmr={{{,}}} fdl=0 fdm=marker

" Options {{{

    " Make Vim more useful
    set nocompatible
    " Enhance command-line completion
    set wildmenu
    " Allow cursor keys in insert mode
    set esckeys
    " Allow backspace in insert mode
    set backspace=indent,eol,start
    " Optimize for fast terminal connections
    set ttyfast
    " Add the g flag to search/replace by default
    set gdefault
    " Use UTF-8 without BOM
    set encoding=utf-8 nobomb
    " Change mapleader
    let mapleader=","
    " Change command mode key
    nnoremap ; :
    " Don’t add empty newlines at the end of files
    set binary
    set noeol
    " Disable backups, swap- amd undofiles
    set nobackup
    set noswapfile
    set noundofile
    " Respect modeline in files
    set modeline
    set modelines=4
    " Enable per-directory .vimrc files and disable unsafe commands in them
    set exrc
    set secure
    " Enable line numbers
    set number
    " Enable syntax highlighting
    syntax on
    " Syntax coloring lines that are too long just slows down the world
    set synmaxcol=100
    " Highlight current line
    set cursorline
    " Use spaces instead of tabs
    set expandtab
    " Make tabs as wide as four spaces
    set tabstop=4
    " Indenting is 4 spaces
    set shiftwidth=4
    " Makes the spaces feel like real tabs
    set softtabstop=4
    " Turns it on
    set autoindent
    " Do it smarter!
    set smartindent
    " Command line height is 2 rows
    set cmdheight=2
    " For better experience with the diagnotsitc messages
    set updatetime=300
    " Show “invisible” characters
    set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
    set list
    " Highlight searches
    set hlsearch
    " Ignore case of searches
    set ignorecase
    " Use case if any caps used
    set smartcase
    " Highlight dynamically as pattern is typed
    set incsearch
    " Always show status line
    set mouse=a
    " Disable error bells
    set noerrorbells
    set novisualbell
    " Don’t reset cursor to start of line when moving around.
    set nostartofline
    " Show the cursor position
    set ruler
    " Don’t show the intro message when starting Vim and be concise generally
    set shortmess=actI
    " Show the current mode
    set showmode
    " Show the filename in the window titlebar
    set title
    " Show the (partial) command as it’s being typed
    set showcmd
    " Start scrolling three lines before the horizontal window border
    set scrolloff=3
    " Don't redraw while executing macros
    set lazyredraw
    " Set to auto read when a file is changed from the outside
    set autoread
    " Hide buffers instead of closing them
    set hidden
    " Spell checking
    set spelllang=en
    set spellfile=~/.vim/spell/en.utf-8.add

    " Continue comments when pressing <Enter>
    set formatoptions+=r
    " Don't continue comments when pressing o/O
    set formatoptions-=o
    " Recognize numbered lists when formatting
    set formatoptions+=n
    " Use indent of second line in paragraph
    set formatoptions+=2
    " Don't break long lines that were already too long
    set formatoptions+=l

    " The maximum number of tabs Vim will open on startup
    set tabpagemax=16

    " Stop indenting when pasting
    set pastetoggle=<f2>

" }

" Color scheme {

    " True colors
    set termguicolors

    try
        colorscheme dark
    catch
    endtry

" }}}

" Insert mode key bindings {{{

    " Alternative Esc (iPad)
    imap § <Esc>

    " Save file Ctrl-s
    imap <C-s> <Esc>:w<CR>a
    " Moves cursor
    imap <C-e> <End>
    imap <C-a> <Home>
    " <M-b> & <M-w>
    imap ∫ <C-o>b
    imap ∑ <C-o>e<Right>
    " Delete and backspace
    imap <C-d> <Del>
    imap <C-h> <BS>

    " Toggle wrapping mode
    imap <F4> <C-o>:setlocal wrap!<CR>
    " Toggle spell check
    imap <F5> <C-o>:setlocal spell! spelllang=en<CR>

    " Shift+Tab decreases indentation
    inoremap <S-Tab> <Esc><<i

    " Map the arrow keys to be based on display lines, not physical lines
    " imap <Down> <Esc>gja
    " imap <Up> <Esc>gka

    " Disable the arrow keys
    " imap <up> <nop>
    " imap <down> <nop>
    " imap <left> <nop>
    " imap <right> <nop>
" }}}

" Normal mode key bindings {{{

    " Alternative Esc (iPad)
    map § <Esc>

    " Remap 0 to first non-blank character
    map 0 ^
    " Save file Ctrl-s
    nmap <C-s> :w<CR>
    " Toggle folding
    " nnoremap <space> za

    " Toggle wrapping mode
    map <F4> :setlocal wrap!<CR>
    " Toggle spell check
    map <F5> :setlocal spell! spelllang=en<CR>
    " Save and run make
    map <F9> :silent w<CR>:silent make<CR>:unsilent redraw!<CR>:cwindow<CR>

    " Map the arrow keys to be based on display lines, not physical lines
    map <Down> gj
    map <Up> gk

    " Disable the arrow keys
    " map <up> <nop>
    " map <down> <nop>
    " map <left> <nop>
    " map <right> <nop>

    " Disable highlight
    map <silent> <leader><cr> :noh<cr>
    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>
    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ve :e $MYVIMRC<CR>
    nmap <silent> <leader>vs :so $MYVIMRC<CR>

    " Upper/lower word
    nmap <leader>u viwU
    nmap <leader>l viwu

    " Upper/lower first char of word
    nmap <leader>U gewvU
    nmap <leader>L gewvu

    " Go to the last active tab
    let g:lasttab = 1
    nmap <leader>, :exe "tabn ".g:lasttab<cr>
    autocmd TabLeave * let g:lasttab = tabpagenr()

    " Switch between tabs
    nmap <C-j> :tabp<CR>
    nmap <C-k> :tabn<CR>

    " Map <M-h,j,k,l> to resize windows
    nmap <silent> ˙ <C-w><
    nmap <silent> ∆ <C-W>-
    nmap <silent> ˚ <C-W>+
    nmap <silent> ¬ <C-w>>

    " Exit to shell
    nmap <leader>z :sh<cr>

    " Paste from the system clipboard
    nmap <leader>p "*p

    " Aligning
    nmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>

    " Strip trailing whitespace
    noremap <leader>ss :call StripWhitespace()<CR>
    function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
    endfunction

    " Rename the current file and remove the old one
    function! RenameFile()
        let old_name = expand('%')
        let new_name = input('New file name: ', expand('%'), 'file')
        if new_name != '' && new_name != old_name
            exec ':saveas ' . new_name
            exec ':silent !rm ' . old_name
            redraw!
        endif
    endfunction
    map <leader>mv :call RenameFile()<cr>

" }}}

" Visual mode {{{

    " Alternative Esc (iPad)
    vmap § <Esc>

    " Pressing * or # searches for the current selection
    function! s:VSetSearch()
        let temp = @@
        norm! gvy
        let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
        let @@ = temp
    endfunction

    vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
    vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Copy to the system clipboard
    vnoremap <leader>c "*y

    " Aligning
    vmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a: :Tabularize /:<CR>

" }

" Command mode key bindings {

    " Alternative Esc (iPad)
    cmap § <Esc>

    " Save a file as root
    cmap w!! w !sudo tee % >/dev/null
    " Moves cursor
    cmap <C-a> <Home>
    cmap <C-e> <End>
    cmap <M-b> <S-Left>
    cmap <M-f> <S-Right>

    " Quick open file in the same directory as the current file
    cnoremap %% <C-R>=expand('%:h') . '/'<cr>
    map <leader>e :edit %%

" }}}

" Pathogen {{{

    let g:pathogen_disabled = []
    call add(g:pathogen_disabled, 'detectindent')
    call add(g:pathogen_disabled, 'tlib_vim')
    call add(g:pathogen_disabled, 'vim-addon-mw-utils')
    call add(g:pathogen_disabled, 'vim-fugitive')
    call add(g:pathogen_disabled, 'vim-javascript')
    " call add(g:pathogen_disabled, 'yankring')
    execute pathogen#infect()

" }}}

" Yankring {{{

    let g:yankring_history_dir = '~/.vim'

" }}}

" Tagbar {{{

    " Toggle Tagbar
    nmap <F8> :TagbarToggle<CR>
    map <leader>tb :TagbarToggle<cr>
    " Auto focus Tagbar and close
    let g:tagbar_autofocus = 1
    let g:tagbar_autoclose = 1

" }}}

" fzf {{{

    set runtimepath+=/usr/local/opt/fzf
    set rtp+=~/.fzf
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>b :Buffers<CR>
    nnoremap <leader>g :GFiles<CR>
    nnoremap <leader>t :Tags<CR>

" }}}

" CoC {{{

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-o> to trigger completion.
    inoremap <silent><expr> <c-o> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Close the preview window when completion is done
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    " Use K to show documentation in preview window
    " nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>r <Plug>(coc-format-selected)
    nmap <leader>r <Plug>(coc-format-selected)

    augroup mygroup
        autocmd!
        " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " Update signature help on jump placeholder
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf <Plug>(coc-fix-current)

    " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p :<C-u>CocListResume<CR>
    " Yank history
    nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

    " Fix broken arrow keys
    if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
        nnoremap <silent> <Esc>OA <Up>
        nnoremap <silent> <Esc>OB <Down>
        nnoremap <silent> <Esc>OC <Right>
        nnoremap <silent> <Esc>OD <Left>
        inoremap <silent> <Esc>OA <Up>
        inoremap <silent> <Esc>OB <Down>
        inoremap <silent> <Esc>OC <Right>
        inoremap <silent> <Esc>OD <Left>
    endif

" }}}

" Status line {{{

    " function! CocStatus() abort
    "   let status = get(g:, 'coc_status', '')
    "   if empty(status) | return '' | endif
    "   return status . ' '
    " endfunction
    "
    " function! CocDiagnosticInfo() abort
    "   let info = get(b:, 'coc_diagnostic_info', {})
    "   if empty(info) | return '' | endif
    "   let msgs = []
    "   if get(info, 'error', 0)
    "     call add(msgs, 'E' . info['error'])
    "   endif
    "   if get(info, 'warning', 0)
    "     call add(msgs, 'W' . info['warning'])
    "   endif
    "   if empty(msgs) | return '' | endif
    "   return ' ' . join(msgs, ' ') . ' '
    " endfunction

    set laststatus=2
    set statusline=
    set statusline+=\ %-3.3n        " Buffer number
    set statusline+=%f              " Filename
    set statusline+=%h%m%r%w        " Status flags
    set statusline+=\ [%{strlen(&ft)?&ft:'none'}]  " File type
    " set statusline+=\ %3*%{CocStatus()}%1*         " Coc status
    " set statusline+=%2*%{CocDiagnosticInfo()}%1* " Diagnostic info
    set statusline+=%=              " Right align remainder
    set statusline+=%-14(%l,%c%)    " Line, Character
    set statusline+=%<%p%%\         " File position

    let s:presentation_mode = 0
    function! TogglePresentationMode()
        if s:presentation_mode == 0
            let s:presentation_mode = 1
            set noshowmode
            set noruler
            set laststatus=0
            set noshowcmd
            set list!
            set number!
            sign unplace *
        else
            let s:presentation_mode = 0
            set showmode
            set ruler
            set laststatus=2
            set showcmd
            set list
            set number
            set signcolumn=auto
        endif
    endfunction

    nnoremap <silent> <leader>h :call TogglePresentationMode()<CR>

" }}}

" Automatic commands {{{

    " let g:detectindent_preferred_expandtab = 1
    " let g:detectindent_preferred_indent = 4
    " let g:detectindent_preferred_when_mixed = 1

    if has("autocmd")
        " Don't highlight the current line if entering another window
        autocmd WinEnter * set cursorline
        autocmd WinLeave * set nocursorline

        " " Keep folds layout
        " autocmd BufWinLeave ?* mkview
        " autocmd BufWinEnter ?* silent loadview

        " Jump to last cursor position unless it's invalid or in an event handler
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif

        " Enable file type detection
        filetype plugin indent on

        " Markdown
        autocmd BufNewFile,BufRead *.md set filetype=markdown

        " JSX
        autocmd BufNewFile,BufRead *.jsx setfiletype javascript.jsx
        autocmd BufNewFile,BufRead *.tsx setfiletype typescript.jsx

        " Auto-detect indent settings
        " autocmd BufReadPost * :DetectIndent

        " Use tabs for makefiles
        autocmd FileType make setlocal noexpandtab

        " Comments in JSON
        autocmd FileType json syntax match Comment +\/\/.\+$+
    endif

" }}}

" Debug {{{
map <leader>mm :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
    \ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
    \ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . "> " .
    \ " FG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#") . "> " .
    \ " BG<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg#") . ">" <CR>
" }}}

" Read local settings {{{

    try
        source ~/.vimrc_local
    catch
    endtry

" }}}