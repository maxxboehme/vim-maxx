set noshowmode

if has('gui_running') && has('win32')
    set guifont=Inconsolata\ for\ Powerline:h11
elseif has('gui_running')
    set guifont=Inconsolata\ for\ Powerline\ Bold\ 11
endif

if has('gui_running')
    let g:lightline = {
                \ 'colorscheme': 'wombat',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'], ['ctrlpmark'] ],
                \   'right': [ [ 'lineinfo', 'syntastic', 'trailingWhitespace', 'mytabs'], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \     'fugitive': 'LightLineFugitiveSymbol',
                \     'filename': 'LightLineFilenameSymbols',
                \   'fileformat': 'LightLineFileformat',
                \     'filetype': 'LightLineFiletype',
                \ 'fileencoding': 'LightLineFileencoding',
                \     'readonly': 'LightLineReadonlySymbols',
                \        'mode' : 'LightLineMode',
                \     'modified': 'LightLineModified',
                \     'ctrlpmark': 'CtrlPMark',
                \ },
                \ 'component_expand': {
                \   'mytabs': 'MyTabs',
                \ 'trailingWhitespace' : 'MyTrailingWhitespace',
                \   'syntastic': 'SyntasticStatuslineFlag',
                \ },
                \ 'component_type': {
                \   'mytabs': 'warning',
                \  'trailingWhitespace' : 'error',
                \   'syntastic': 'error',
                \ },
                \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
                \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
                \ }
else
    let g:lightline = {
                \ 'colorscheme': 'powerline',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename'], ['ctrlpmark'] ],
                \   'right': [ [ 'lineinfo', 'syntastic', 'trailingWhitespace', 'mytabs'], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \     'fugitive': 'LightLineFugitive',
                \     'filename': 'LightLineFilename',
                \   'fileformat': 'LightLineFileformat',
                \     'filetype': 'LightLineFiletype',
                \ 'fileencoding': 'LightLineFileencoding',
                \     'readonly': 'LightLineReadonly',
                \        'mode' : 'LightLineMode',
                \     'modified': 'LightLineModified',
                \     'ctrlpmark': 'CtrlPMark',
                \ },
                \ 'component_expand': {
                \   'mytabs': 'MyTabs',
                \ 'trailingWhitespace' : 'MyTrailingWhitespace',
                \   'syntastic': 'SyntasticStatuslineFlag',
                \ },
                \ 'component_type': {
                \   'mytabs': 'warning',
                \  'trailingWhitespace' : 'error',
                \   'syntastic': 'error',
                \ }
                \ }
endif

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonlySymbols()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "\ue0a2"
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function! LightLineFugitiveSymbol()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = "\ue0a0 "  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? "\ue0a0 "._ : ''
    endif
    return ''
endfunction

function! LightLineFilenameSymbols()
    let fname = expand('%:t')
    return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightLineReadonlySymbols() ? LightLineReadonlySymbols() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyMode()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? 'NERDTree' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFileformat()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? '' :
                \ winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFiletype()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? '' :
                \ winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFileencoding()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? '' :
                \ winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction
function! MyTabs()
    let line = search('\t', 'n')
    if line != 0
        return 'Tabs:' . line
    else
        return ''
    endif
endfunction

function! MyTrailingWhitespace()
    let line = search('\s\+$', 'n')
    if line != 0
        return 'Trailing Whitespace:' . line
    else
        return ''
    endif
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

augroup MyAutoErrorsWarnings
    autocmd!
    autocmd BufWritePost * call lightline#update()
augroup END
