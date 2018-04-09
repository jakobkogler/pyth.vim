command! -nargs=0 PythREPL call pyth#REPL()

augroup pythgroup
    autocmd!

    autocmd BufNewFile,BufRead *.pyth.out setlocal nomodifiable autoread

    autocmd FileType pyth command! -buffer -nargs=0 PythRun call pyth#Run()
    autocmd FileType pyth command! -buffer -nargs=0 PythInput call pyth#Input()
    autocmd FileType pyth command! -buffer -nargs=0 PythInputClose call pyth#InputClose()
    autocmd FileType pyth command! -buffer -nargs=0 PythOutputClose call pyth#OutputClose()
    autocmd FileType pyth command! -buffer -nargs=? PythDocu call pyth#Docu("<args>")
    autocmd FileType pyth command! -buffer -nargs=0 PythDocuClose call pyth#DocuClose()

    autocmd FileType pyth nnoremap <buffer> <leader>r :PythRun<cr>
    autocmd FileType pyth nnoremap <buffer> <leader>i :PythInput<cr>
    autocmd FileType pyth nnoremap <buffer> <leader>I :PythInputClose<cr>
    autocmd FileType pyth nnoremap <buffer> <leader>R :PythOutputClose<cr>
    autocmd FileType pyth nnoremap <buffer> <leader>d :PythDocu 
    autocmd FileType pyth nnoremap <buffer> <leader>D :PythDocuClose<cr>
augroup END
