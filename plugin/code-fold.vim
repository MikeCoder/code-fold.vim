""""""""""""""""""""""""""""""""""""""""""""
" let VERSION = '0.0.1'
" let AUTHOR  = 'Mike Tang'
" let EMAIL   = 'mikecoder.cn@gmail.com'
""""""""""""""""""""""""""""""""""""""""""""
set foldenable
set foldmethod=manual
set foldlevel=99

set viewdir=$HOME/.vim/view

au BufWinLeave *.* mkview 1
au BufWinEnter *.* silent! loadview 1

map <leader>zz @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>
map ff @=((foldclosed(line('.')) < 0) ? 'zf' : 'zd')<CR>

