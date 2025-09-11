# Introduction

An attempt at creating a more portable dotfiles setup.

## Structure

Each directory in the repository root represents a configuration 'package'
that is managed by GNU `stow`. Packages also serve as a logical way to 
seperate and organise different applications/tools configuration files.

Current packages are:

- `bash` - for bash shell configuration. `.bashrc` etc.
- `git`
- `neovim`
- `preferences`
- `scripts`
- `tmux`
- `vim`

## Installation

Use GNU `stow` to install/manage dotfiles.

Each directory in the `dotfiles` repo represents a 'package'. You can 'insall'
individual dotfiles 'packages' with `stow`.

### Deploy configurations

Before we start, let’s explain the 3 terms we need to know to work with `stow`, 
which are: Package, Stow Directory and Target Directory.

- Package: Is a collection of files that must be 'installed' together in the 
  same target directory.
- Stow directory: Is the repository where all our packages will be.
- Target directory: It’s the directory where we want to install those 
  configurations that are in our packages.

The repository includes a `.stowrc` which configures the defaults to use for
the Stow directory, and the target directory:

```
--dir=${HOME}/code/dotfiles --target=${HOME} --ignore=README.md
```

To install a directory we basically call stow and provide a package name,
which in this case is a directory in the repository root.

- Example: Install the `bash` 'package' to deploy our Bash configuration

```bash
cd ~/code/dotfiles
stow -v bash
```

`-v` makes `stow` more verbose and prints what is being changed.

You can also pass `-n` to perform a dry-run, to see what will be installed,
without any actual changes being made.

### Adopt existing configurations

You can also 'adopt' an existing configuration file into the `stow` package
directory when you want to bring a new configuration under `dotfiles`
version control.... well sort of... `stow` will not actually do anything
if nothing exists in the package directory. What the `--adopt` options
allows us to do is swap-out an existing file with a symlink to the file(s) in
the package directory.

Thus, to bring a new configuration into the `stow` packages you:

1. Copy the existing configuration file/dir into the package directory you
want it in, or create an empty file/directory

2. Adopt the configuration to swap out the file/directory for a symlink to
those in the `stow` package directory.

- Example: Adopt `.bashrc`  into the `bash` package in our `dotfiles`

```bash
cd ~/code/dotfiles
mkdir bash
touch bash/.bashrc
stow --adopt --target=${HOME} bash
```
