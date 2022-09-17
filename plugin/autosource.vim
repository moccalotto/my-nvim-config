augroup autosource
    autocmd!
    " When vimrc is saved, automatically source it.
    autocmd BufWritePost $MYVIMRC             source %
    autocmd BufWritePost ~/.config/nvim/*.vim source %
    autocmd BufWritePost ~/.config/nvim/*.lua source %

    " Attempt to create parent directories before saving files.
    autocmd BufWritePre * :call system('mkdir -p '.shellescape(expand('%:p:h')))
augroup END
