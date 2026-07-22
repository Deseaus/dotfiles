    ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
    ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
    ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
    ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
    ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                                 
                                                                                                                                                                                      
ZSH with a dash of Antidote and a pinch of (Neo)Vim, a quick recipe for my dotfiles.

## The Secret Sauce 

Some of the pronounced notes of obsessive simplicty and Python indentation come from the following ingredients. They all blend and complement each other to achieve a clear, well-thought flavour.

### ZSH

* Managed by [Antidote](https://github.com/mattmc3/antidote), compiled into a static bundle.
* [Bullet Train](https://github.com/caiogondim/bullet-train-oh-my-zsh-theme) prompt.
* [Solarized Dark](http://ethanschoonover.com/solarized) theme.

### Neovim

The primary editor config (`nvim-config/`, symlinked to `~/.config/nvim`), built on [lazy.nvim](https://github.com/folke/lazy.nvim):

* [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy find/grep, an [aerial.nvim](https://github.com/stevearc/aerial.nvim) code outline, and fuzzy-searchable undo history.
* LSP via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [Mason](https://github.com/williamboman/mason.nvim), with [ruff](https://github.com/astral-sh/ruff) + pyright for Python and [conform.nvim](https://github.com/stevearc/conform.nvim) for formatting.
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) completion, [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), and [trouble.nvim](https://github.com/folke/trouble.nvim) diagnostics.
* [undotree](https://github.com/jiaoshijie/undotree) and [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) for transparent Vim/tmux pane navigation.
* [Startify](https://github.com/mhinz/vim-startify) splash screen and [Solarized](https://github.com/lifepillar/vim-solarized8) theme.

### Vim

The legacy config (`vimrc`, `vim/`) is kept around for plain Vim:

* Plugins managed by [vim-plug](https://github.com/junegunn/vim-plug).
* [Unite](https://github.com/Shougo/unite.vim) and an [Ag](https://github.com/ggreer/the_silver_searcher) backend to power searches of all kinds.
* [Startify](https://github.com/mhinz/vim-startify) to open up Vim with nice ASCII art, sessions and bookmarks.

## Tmux

* Plugins managed by [TPM](https://github.com/tmux-plugins/tpm): resurrect, continuum, pain-control, copycat, yank, open, battery, cpu.
* Theme is [Maglev](https://github.com/caiogondim/maglev).

## Licence

The MIT License (MIT) Copyright © 2014-2026 Daniel Vidal Hussey 
