set runtimepath+=~/.vim

source ~/.vim/vimrcs/plugins.vim
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/filetypes.vim
source ~/.vim/vimrcs/plugins_config.vim
source ~/.vim/vimrcs/extended.vim
" Custom lua configurations
lua require('config')

""""""""""""""""""""""""""""""""""""""""
"""""""""" NvimTree options """"""""""""
""""""""""""""""""""""""""""""""""""""""
function! NvimTreeToggleAll()
    let current_tab = tabpagenr()
    if g:nvim_tree_open
        tabdo NvimTreeClose
        let g:nvim_tree_open = 0
    else
        tabdo NvimTreeOpen
        let g:nvim_tree_open = 1
    endif
    execute 'tabnext' current_tab
endfunction

let g:nvim_tree_open = 0
if isdirectory(argv(0))
    let g:nvim_tree_open = 1
endif

" Increase/Decrease splits width
nnoremap <C-w>. <C-w>3<
nnoremap <C-w>, <C-w>3>

" Tab key management
set expandtab

nnoremap <silent><leader>mt :ContextToggle<CR>  
nnoremap nt :call NvimTreeToggleAll()<CR>
""""""""""""""""""""""""""""""""""""""""""""

" Disable automatic folding
set nofoldenable

" Allow to show always signcolumn always, util for vgit_gutter
set signcolumn=yes

colorscheme bamboo-multiplex

" For working with node projects and linters
" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

"-----------------vim-test
let g:test#strategy = 'toggleterm'
" Usa bin/rails test en lugar de ruby directamente (Minitest)
let g:test#ruby#minitest#executable = 'bundle exec rake test'

" Usa bin/rspec si estás en un proyecto con Bundler
let g:test#ruby#rspec#executable = 'bundle exec rspec'
" Ejecutar test bajo el cursor
nnoremap <leader>tn :TestNearest<CR>

" Ejecutar todos los tests del archivo
nnoremap <leader>tf :TestFile<CR>

" Repetir el último test
nnoremap <leader>tl :TestLast<CR>

" Abrir archivo del último test ejecutado
n
