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
    let isGit = system('d=`pwd`; while [ "$d" != "" ]; do [ -d "$d"/.git ] && echo 1 && exit; d=${d%/*}; done; echo 0; exit;')

    if isGit == 1
        let wfile = system('echo ' . '$(echo ${$(echo ' . expand('%:p') . ')//\//-}"\c")-$(git branch | grep "*" | cut -d " " -f2)"\c"')
    else
        let wfile = system('echo ' . '$(echo ${$(echo ' . expand('%:p') . ')//\//-}"\c")"\c"')
    endif

    let command = 'mkview! ' . "~/.vim/view/" . wfile
    execute command
endfunction

function! MLoadView()
    let isGit = system('d=`pwd`; while [ "$d" != "" ]; do [ -d "$d"/.git ] && echo 1 && exit; d=${d%/*}; done; echo 0; exit;')

    if isGit == 1
        let rfile = system('echo ' . '$(echo ${$(echo ' . expand('%:p') . ')//\//-}"\c")-$(git branch | grep "*" | cut -d " " -f2)"\c"')
    else
        let rfile = system('echo ' . '$(echo ${$(echo ' . expand('%:p') . ')//\//-}"\c")"\c"')
    endif

    let rfile = $HOME . "/.vim/view/" . rfile
    let fileExists = system('if [ -f ' . rfile . ' ]; then echo 1; else echo 0; fi')
    if fileExists == 1
        let command = 'source ' . rfile
        execute command
        let command = 'syntax on'
        execute command
    endif
endfunction

map <leader>zz @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>
map ff @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>

