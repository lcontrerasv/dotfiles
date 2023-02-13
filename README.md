# lcontrerasv dotfiles

## Requirements

First, set zsh as your login shell:

    chsh -s $(which zsh)

Then, install Oh my ZSH!:

    https://ohmyz.sh/#install

And finally, you need to install the next tools:

    kitty       (Terminal)          - https://sw.kovidgoyal.net/kitty/
    bat         (Better cat)        - https://github.com/sharkdp/bat
    fzf         (Fuzzy finder)      - https://github.com/junegunn/fzf
    lsd         (Better ls)         - https://github.com/Peltoche/lsd

    Optionally, for macos:

    Rectangle   (Window Manager)    - https://rectangleapp.com/

-   I recommend to install this with a package manager like apt, yum or brew.

## Install

1.- Clone on your computer:

    git clone --recurse-submodules https://github.com/lcontrerasv/dotfiles.git

2.- Run the setup:

    .../dotfiles/setup.sh -i

## Update

1.- Run the setup for update:

    .../dotfiles/setup.sh -u
