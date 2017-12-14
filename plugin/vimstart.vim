fun! Start()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    " Start a new buffer ...
    enew
    " ... and set some options for it
    setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nobuflisted
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber
    " Now we can just write to the buffer, whatever you want.
    call append('$', "")
    if !empty(glob("./.vimstart"))
      let motd=split(system("./.vimstart"), '\n')
    else
      let motd=split(system("~/.config/nvim/vimstart"), '\n')
    endif
    let maxline=max(map(copy(motd), 'len(v:val)'))
    let space=repeat(' ', (winwidth(0) - maxline)/2)
    call append('$', map(motd, 'space . v:val'))
    let leading=repeat([''], (winheight(0)-len(getline(0, '$')))/2)
    call append('^', leading)
    execute ":0"
    " No modifications to this buffer
    setlocal nomodifiable nomodified
    " When we go to insert mode start a new buffer, and start insert
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

" Run after "doing all the startup stuff"
autocmd VimEnter * call Start()
