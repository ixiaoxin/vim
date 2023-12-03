" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" %% --> %:h<Tab>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set number
runtime macros/matchit.vim

nnoremap<silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" make * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
	let temp = @s
	norm! gv"sy
	let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@/<CR><CR>

nnoremap & :&&<CR>
xnoremap & :&&<CR>

set undodir=~/tmp/vimundo//,.
set backupdir=~/tmp/vimbackup//,.
set directory=~/tmp/vimswap//,.
