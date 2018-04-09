let s:pyth_exec = expand("<sfile>:p:h:h") . "/pyth/pyth.py"

function! pyth#REPL()
    execute "terminal " . s:pyth_exec
endfunction

function! pyth#Run()
    let l:file = pyth#Filename()
   
    silent! !clear
    silent! execute "!touch " . l:file . ".in"
    silent! execute "!" . s:pyth_exec . " --newline " . l:file . " <" . l:file . ".in &>" . l:file . ".out"
    redraw!

    if !pyth#GotoWindow(l:file . ".out")
        execute "split " . l:file . ".out"
    endif
endfunction

function! pyth#Filename()
    let l:file_pieces = split(expand("%"), '\.')
    if l:file_pieces[-1] !=# "pyth"
        call remove(l:file_pieces, -1)
    endif
    return join(l:file_pieces, '.')
endfunction

function! pyth#Input()
    let l:file = pyth#Filename()
    if !pyth#GotoWindow(l:file . ".in")
        execute "belowright split " . l:file . ".in"
    endif
endfunction

function! pyth#InputClose()
    let l:file = pyth#Filename()
    if pyth#GotoWindow(l:file . ".in")
        bdelete
    endif
endfunction

function! pyth#OutputClose()
    let l:file = pyth#Filename()
    if pyth#GotoWindow(l:file . ".out")
        bdelete
    endif
endfunction

function! pyth#GotoWindow(filename)
    let l:win_nr = bufwinnr(a:filename)
    if l:win_nr > 0
        execute l:win_nr . "wincmd w"
        return 1
    endif
endfunction
