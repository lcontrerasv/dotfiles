# My dotfiles

## Requirements

First, set zsh as your login shell:
```sh
    chsh -s $(which zsh)
```
Then, you need to install the next tools:

    kitty       (Terminal)          - https://sw.kovidgoyal.net/kitty/
    bat         (Better cat)        - https://github.com/sharkdp/bat
    fzf         (Fuzzy finder)      - https://github.com/junegunn/fzf
    lsd         (Better ls)         - https://github.com/Peltoche/lsd
    neovim      (Better vim)        - https://neovim.io/
    nvchad      (Theme for nvim)    - https://nvchad.com/

-   I recommend to install this with a package manager like apt, yum or brew.

## Install

1.- Clone on your computer:
```sh
    git clone --recurse-submodules https://github.com/lcontrerasv/dotfiles.git
```

2.- Run the setup:
```sh
    cd dotfiles
    ./setup.sh -i
```
## Update

1.- Run the setup for update:
```sh
    cd dotfiles
    ./setup.sh -u
```
