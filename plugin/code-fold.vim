""""""""""""""""""""""""""""""""""""""""""""
" let VERSION = '0.0.7'
" let AUTHOR  = 'Mike Tang'
" let EMAIL   = 'mikecoder.cn@gmail.com'
""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=manual
set foldlevel=99
set viewdir=$HOME/.vim/view

se fcs=vert:\|

au BufWinLeave *.* call MMkView() " mkview 1
au BufWinEnter *.* call MLoadView() " silent! loadview 1

function! MMkView()
    call InitPlugin()

    " most system file starts with '__'
    if system("var='" . expand('%:f') . "'; if [[ ${var:0:2} == '__' ]]; then echo 1; else echo 0; fi") == 1
        return
    endif

    let currentFile = system('echo $(echo ' . expand('%:p') . ' | sed "s/[[:space:]]/=/g")"\c"')

    let isGit = system('d=`pwd`; while [ "$d" != "" ]; do [ -d "$d"/.git ] && echo 1 && exit; d=${d%/*}; done; echo 0; exit;')

    if isGit == 1
        let wfile = system('echo ' . '$(echo ${$(echo ' . currentFile . ')//\//=}"\c")-$(git branch | grep "*" | cut -d " " -f2).vim"\c"')
    else
        let wfile = system('echo ' . '$(echo ${$(echo ' . currentFile . ')//\//=}"\c").vim"\c"')
    endif

    let command = 'mkview! ' . "~/.vim/view/" . wfile
    execute command
endfunction

function! MLoadView()
    call InitPlugin()

    " most system file starts with '__'
    if system("var='" . expand('%:f') . "'; if [[ ${var:0:2} == '__' ]]; then echo 1; else echo 0; fi") == 1
        return
    endif

    let currentFile = system('echo $(echo ' . expand('%:p') . ' | sed "s/[[:space:]]/=/g")"\c"')

    let isGit = system('d=`pwd`; while [ "$d" != "" ]; do [ -d "$d"/.git ] && echo 1 && exit; d=${d%/*}; done; echo 0; exit;')

    if isGit == 1
        let rfile = system('echo ' . '$(echo ${$(echo ' . currentFile . ')//\//=}"\c")-$(git branch | grep "*" | cut -d " " -f2).vim"\c"')
    else
        let rfile = system('echo ' . '$(echo ${$(echo ' . currentFile . ')//\//=}"\c").vim"\c"')
    endif

    let rfile = $HOME . "/.vim/view/" . rfile
    let fileExists = system('if [ -f ' . rfile . ' ]; then echo 1; else echo 0; fi')

    if fileExists == 1
        let command = 'source ' . rfile
        execute command
    endif
endfunction

function! InitPlugin()
    let isInit = system('if [ -d ~/.vim/view ]; then echo 1; else echo 0; fi')
    if isInit == 0
        echo 'This is the first time to set the code fold plugin, create ~/.vim/view folder'
        let res = system('mkdir ~/.vim/view')
    endif
endfunction

map <leader>zz @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>
map ff @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>

