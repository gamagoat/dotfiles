# dotfiles
A collection of dotfiles I use across various machines.

# symlinks
I found it easiest to manage symlinks via stow.  For example, to symlink the entire neovim config dir, you can:

```sh
stow --target=/Users/<user>/.config/nvim nvim/
```

