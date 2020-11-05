Neovim config
=============

Plugins
-------

### Main plugins

* [Townk/vim-autoclose](https://github.com/Townk/vim-autoclose)
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [jeetsukumaran/vim-buffergator](https://github.com/jeetsukumaran/vim-buffergator)
* [preservim/nerdtree](https://github.com/preservim/nerdtree)
* [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [tiagofumo/vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
* [mbbill/undotree](https://github.com/mbbill/undotree)
* [airblade/vim-rooter](https://github.com/airblade/vim-rooter)
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)

### Golang plugins

* [fatih/vim-go](https://github.com/fatih/vim-go)
* [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)

### Other plugins

* [shime/vim-livedown](https://github.com/shime/vim-livedown)
* [martinda/Jenkinsfile-vim-syntax](https://github.com/martinda/Jenkinsfile-vim-syntax)

Installation to macOS
------------

### Install Neovim

* `UltiSnips` requires python >= 2.7 or python3.

```sh
$ brew install python3

$ pip3 install neovim
```

### Install vim-plug

```
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Get config
```
$ git clone https://github.com/doncasper/nvim-config ~/.config/nvim
```

### Plugins requirements

* `shime/vim-livedown`

First make sure you have [node](http://nodejs.org/) with [npm](https://www.npmjs.org/) installed.

```sh
$ npm install -g livedown
```

### Install plugins

Install plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

Open Neovim and call `:PlugInstall` to install pluggins.

Then call `:GoInstallBinaries`.
