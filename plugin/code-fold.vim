""""""""""""""""""""""""""""""""""""""""""""
" let VERSION = '0.0.2'
" let AUTHOR  = 'Mike Tang'
" let EMAIL   = 'mikecoder.cn@gmail.com'
""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=manual
set foldlevel=99

set viewdir=$HOME/.vim/view

au BufWinLeave *.* call MMkView() " mkview 1
au BufWinEnter *.* call MLoadView() " silent! loadview 1

function! MMkView()
    let isGit = system('git branch')
    echo isGit
    if isGit ==? "fatal: Not a git repository (or any of the parent directories): .git\n"
        let isGit = 0
    else
        let isGit = 1
    endif

    if isGit == 1
        let wfile = system('echo ' . expand('%:t') . '-$(echo ${$(pwd)//\//-})-$(git branch | grep "*" | cut -d " " -f2)')
        echo wfile
        let command = 'mkview! ' . "~/.vim/view/" . wfile
    else
        let wfile = system('echo ' . expand('%:t') . '-$(echo ${$(pwd)//\//-})')
        echo wfile
        let command = 'mkview! ' . "~/.vim/view/" . wfile
    endif

    echo command
    execute command
endfunction

function! MLoadView()
    let isGit = system('git branch')
    if isGit ==? "fatal: Not a git repository (or any of the parent directories): .git\n"
        let isGit = 0
    else
        let isGit = 1
    endif

    if isGit == 1
        let rfile = system('echo ' . expand('%:t') . '-$(echo ${$(pwd)//\//-}"\c")-$(git branch | grep "*" | cut -d " " -f2)"\c"')
        let rfile = $HOME . "/.vim/view/" . rfile
        let fileExists = system('if [ -f ' . rfile . ' ]; then echo 1; else echo 0; fi')
        if fileExists == 1
            echo expand(rfile)
            let command = 'source ' . rfile
            execute command
        endif
    else
        let rfile = system('echo ' . expand('%:t') . '-$(echo ${$(pwd)//\//-}"\c")"\c"')
        let rfile = $HOME . "/.vim/view/" . rfile
        let fileExists = system('if [ -f ' . rfile . ' ]; then echo 1; else echo 0; fi')
        if fileExists == 1
            let command = 'source ' . rfile
            execute command
        endif
    endif
endfunction

map <leader>zz @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>
map ff @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>

