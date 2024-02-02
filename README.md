# Dotfiles
This repository keeps track of config files used on my linux machines.
[GNU Stow](https://www.gnu.org/software/stow/) is used to manage the dotfiles, please refer to below on a basic usage guide.

## Install
1. You can clone this repository to anywhere on your system.

2. Enter the repo after cloning
```sh
cd stow_dotfiles
```
3. Run **stow** to symlink all files in *dotfiles_home* to your home directory
```sh
stow --no-folding -t ~ dotfiles_home    # '--no-folding' is used to symlink only files, creating folders if they doesn't exist
```

The setup is now complete!

## Update
This section is referenced when removing files inside *dotfiles_home*. For adding files run step 3 in [install](#Install) again.
- Removing a file: add the *-R* flag for pruning obsolete symlinks in your home directory
```sh
stow --no-folding -R -t ~ dotfiles_home
```

## Remove
- Use the *-D* flag to remove all symlinks inside your home directory

