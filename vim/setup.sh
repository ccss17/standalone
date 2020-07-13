#!/bin/bash
set -xe
STANDALONE_VIM_PATH=~/.standalone/vim
mkdir $STANDALONE_VIM_PATH -p
cp standalone-vim.sh $STANDALONE_VIM_PATH
cp libgpm.so.2 $STANDALONE_VIM_PATH
cp libpython3.5m.so.1.0 $STANDALONE_VIM_PATH
cp vim $STANDALONE_VIM_PATH
tar xvf vim82.tar.gz
cp -r vim82 $STANDALONE_VIM_PATH
echo alias vi=~/.standalone/vim/standalone-vim.sh >> ~/.bashrc

~/.standalone/curl/standalone-curl.sh -sfLo ~/.vim/autoload/onedark.vim --create-dirs https://raw.githubusercontent.com/joshdick/onedark.vim/master/autoload/onedark.vim
~/.standalone/curl/standalone-curl.sh -sfLo ~/.vim/colors/onedark.vim --create-dirs https://raw.githubusercontent.com/joshdick/onedark.vim/master/colors/onedark.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat <<EOT > ~/.vimrc
let \$VIM         = \$HOME . "/.standalone/vim/vim82" 
let \$VIMRUNTIME  = \$HOME . "/.standalone/vim/vim82"
set runtimepath^=\$VIMRUNTIME
set helpfile=\$VIMRUNTIME/doc/help.txt
syntax on
color onedark
set switchbuf=usetab
set encoding=utf-8
set hlsearch
set ignorecase
set softtabstop=4
set shiftwidth=4
autocmd FileType make setlocal noexpandtab
se nu rnu
set smartindent
set tabstop=4
set expandtab

map <silent> <C-c> :IndentLinesToggle<CR>
map <silent> <C-m> :se nu!<CR>:se rnu!<CR>
map <silent> <C-s> :w<CR>
map <silent> <C-q> :q<CR>
map <silent> <C-o> :vsp ~/.vimrc<CR>
nmap <silent> <F10> :tabn<CR>
nmap <silent> <F9> :tabp<CR>
nmap <silent> <C-p> :NERDTreeToggle<CR>
nmap <silent> <Up> :resize -5<CR>
nmap <silent> <Down> :resize +5<CR>
nmap <silent> <Left> :vertical resize -5<CR>
nmap <silent> <Right> :vertical resize +5<CR>
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

cnoreabbrev install PlugInstall
cnoreabbrev status PlugStatus
cnoreabbrev update PlugUpdate
cnoreabbrev euckr :e ++enc=euc-kr

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi Comment guifg=#afb0ff ctermfg=LightCyan
set t_Co=256
set cursorline
hi cursorline term=none cterm=none guibg=#303000 ctermbg=234

let NERDTreeShowHidden=1
set nocompatible              
filetype off                 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'phanviet/vim-monokai-pro'
Plugin 'tpope/vim-eunuch'
call vundle#end()            
filetype plugin indent on   
EOT
~/.standalone/vim/standalone-vim.sh +PluginInstall +qall
