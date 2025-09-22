# Introduction

An attempt at creating a more portable dotfiles setup.

## Goals

We all need goals right? Since this is another build of my configuration or
'dotfiles' there are a set of design goals, rather than it just being the same
organic evolution that it's been the last 20 years (yeah it's been that long).

1. Keep it simple. I've stepped into the trap of complicating things too much,
   which leads to unmaintainable configs.

2. Remain highly portable. I use MacOS and Linux, dotfiles should be as portable
   as possible.

3. Reduce or remove as much external dependencies. People with public repos and
   plugins make breaking changes. I work on servers in data centers that don't
   always have internet connections. So "quickly" pulling a repo for dotfiles
   is not always an option.

4. Lowest common denominator and backward compatibility. Servers and enterprise
   operating systems aren't always on the latest nightly build of your favourite
   editor, and don't have terminals with millions of colors. A `.vimrc` or
   `.bashrc` should "Just Work" when copied onto them.

## Structure

Each directory in the repository root represents a configuration 'package'
that is managed by GNU `stow`. Packages also serve as a logical way to
separate and organise different applications/tools configuration files.

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

Each directory in the `dotfiles` repo represents a 'package'. You can 'install'
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
version control... well sort of... `stow` will not actually do anything
if nothing exists in the package directory. What the `--adopt` options
allows us to do is swap-out an existing file with a symlink to the file(s) in
the package directory.

Thus, to bring a new configuration into the `stow` packages you:

1. Copy the existing configuration file/directory into the package directory you
   want it in, or create an empty file/directory

2. Adopt the configuration to swap out the file/directory for a symlink to
   those in the `stow` package directory.

- Example: Adopt `.bashrc` into the `bash` package in our `dotfiles`

```bash
cd ~/code/dotfiles
mkdir bash
touch bash/.bashrc
stow --adopt --target=${HOME} bash
```

## System setup

These are notes about setting up a (my) system to work the way I want it. Your
mileage may vary, but I keep it here as a reference.

### Remap keyboard keys

The Caps Lock key on a keyboard is pretty redundant to me. After 20+ years of
Unix and Linux I still haven't found a good reason for it. I have a well
practiced pinky on my left hand to hold down the shift key if I need to type
more than 2 capital letters, and have not sustained any RSI yet.

In the last few years I've become very attached to `tmux`, to the point where
it's an invaluable part of my daily workflow. Once I switched from `screen` as
terminal multiplexer there was no going back. The default prefix key combo,
`C-b` is masochistic however. I have become very accustomed to using the Caps
Lock key as another Control key, and remapping the `tmux` prefix to `C-a`. This
feels more natural to me, and I suspect is an easier muscle memory to train.

The challenge strangely enough is Linux. On MacOS you simply update a default
or use the keyboard preferences to re-assign Caps Lock to Control and be done
with it. With Linux keyboard handling, especially using any sort of window
manager seems to be a mess. The long, tedious transition to Wayland from X.org
is also messy. The net result is that there seems to be no standard way to
configure remapped keys consistently.

In the bad (good?) old days of X.org you could use `setxkbmap` at the X session
level and be done with it. If you live in the Gnome ecosystem you could set a
Gnome session default using `dconf`. Wayland... without Gnome? Well it's
complicated, and even on page 4 of a Google search result, no one seems to be
sure.

The solution. Maybe a bit of a nuclear option, but it seems to work.
Consistently. Make a modification at the `udev` level - system wide. I'm not
going to go into the technical details of how this works, but it works.
Regardless of whether you are running exotic window managers on either Wayland
or X.org, or have a desktop environment like Gnome or KDE.

See the `hwdb(7)` manual page for more details. In short the steps are:

- Check the keycode for Caps Lock on you keyboard with `sudo showkey
--scancodes`. Make sure you get the code for the "key down" event, and not
  the key code produced when the key is released. On most AT keyboards this
  will be `0x3a`.

- Create a file in `/etc/udev/hwdb.d/` e.g. `10-remap-keys.hwdb`

```bash
# 10-remap-keys.hwdb
evdev:atkbd:dmi:*            # built-in keyboard: match all AT keyboards for now
 KEYBOARD_KEY_3a=leftctrl    # bind capslock to leftctrl
```

For the `hwdb(7)` syntax to identify the key we drop the `0x` hexadecimal
identifier from the keycode.

- Update the hardware database and trigger the required `udev` events

```bash
sudo systemd-hwdb update
sudo udevadm trigger --verbose --sysname-match='event*'
```

That's it. Live long and prosper.

## Todo List

see [TODO.md](TODO.md)

## Resources

[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts)
