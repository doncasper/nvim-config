Neovim config
=============

Plugins
-------

* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
* [mbbill/undotree](https://github.com/mbbill/undotree)
* [fatih/vim-go](https://github.com/fatih/vim-go)
* [jodosha/vim-godebug](https://github.com/jodosha/vim-godebug)
* [godoctor/godoctor.vim](https://github.com/godoctor/godoctor.vim)
* [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)
* [Shougo/deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
* [zchee/deoplete-go](https://github.com/zchee/deoplete-go)
* [tpope/vim-markdown](https://github.com/tpope/vim-markdown)
* [shime/vim-livedown](https://github.com/shime/vim-livedown)
* [SirVer/ultisnips](https://github.com/SirVer/ultisnips)
* [Townk/vim-autoclose](https://github.com/Townk/vim-autoclose)

Installation to macOS
------------

### Install Neovim

* `deoplete` requires Neovim with Python3 support("+python3").
* `UltiSnips` requires python >= 2.7 or python3.

```sh
$ brew install python3

$ pip3 install neovim
```

### Get config
```
$ git clone https://github.com/doncasper/nvim-config ~/.config/nvim
```

### Plugins requirements

* `jodosha/vim-godebug` required [delve](https://github.com/derekparker/delve) installed.

```sh
$ brew install go-delve/delve/delve
```

If you get error throw installing delve with brew, check [this issue](https://github.com/go-delve/homebrew-delve/issues/17).

* `shime/vim-livedown`

First make sure you have [node](http://nodejs.org/) with [npm](https://www.npmjs.org/) installed.

```
$ npm install -g livedown
```

### Install plugins

Install plugin manager: [vim-plug](https://github.com/junegunn/vim-plug)

Open Neovim and call `:PlugInstall` to install pluggins.


