" augroup autosource
"     autocmd!
"     " When vimrc is saved, automatically source it.
"     autocmd BufWritePost $MYVIMRC                   source %
"     autocmd BufWritePost ~/.config/nvim/**/*.vim    source %
"     autocmd BufWritePost ~/.config/nvim/**/*.lua    source %
"
"     " Attempt to create parent directories before saving files.
"     autocmd BufWritePre * :call system('mkdir -p '.shellescape(expand('%:p:h')))
" augroup END

augroup neovim
  autocmd!
  autocmd BufWritePost ~/.config/nvim/*.vim          source %
  autocmd BufWritePost ~/.config/nvim/*.lua          source %
  autocmd BufWritePost ~/AppData/Local/nvim/*.vim    source %
  autocmd BufWritePost ~/AppData/Local/nvim/*.lua    source %
  autocmd BufWritePost $XDG_CONFIG_HOME . "/*.vim"   source %
  autocmd BufWritePost $XDG_CONFIG_HOME . "/*.lua"   source %
augroup END:
