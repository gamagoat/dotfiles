# dotfiles
A collection of dotfiles I use across various machines.

# symlinks
I found it easiest to manage symlinks via stow.

Assuming you are in this repo, `.dotfiles/`, running
```sh
stow nvim/
```

with an `nvim/` structure of:

```sh
./nvim
└── .config
    └── nvim
        ├── init.lua
        └── plugin
            └── lastplace.lua
```

will result in the following symlink:

```sh
nvim ⇒ ../.dotfiles/nvim/.config/nvim
```
