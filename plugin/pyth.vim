command! -nargs=0 PythREPL call pyth#REPL()
command! -nargs=0 PythRun call pyth#Run()
command! -nargs=0 PythInput call pyth#Input()
command! -nargs=0 PythInputClose call pyth#InputClose()
command! -nargs=0 PythOutputClose call pyth#OutputClose()

augroup pythgroup
    autocmd!
    autocmd BufNewFile,BufRead *.pyth.out setlocal nomodifiable autoread
    autocmd FileType pyth nnoremap <buffer> <leader>r :PythRun<CR>
    autocmd FileType pyth nnoremap <buffer> <leader>i :PythInput<CR>
    autocmd FileType pyth nnoremap <buffer> <leader>I :PythInputClose<CR>
    autocmd FileType pyth nnoremap <buffer> <leader>R :PythOutputClose<CR>
augroup END
