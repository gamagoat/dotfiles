# dotfiles
A collection of dotfiles I use across various machines.

# symlinks
I found it easiest to manage symlinks via stow.

```sh
stow nvim/
```

will symlink `nvim/`: 

```
./nvim
└── .config
    └── nvim
        ├── init.lua
        └── plugin
            └── lastplace.lua
```

in `/.config/nvim/`
