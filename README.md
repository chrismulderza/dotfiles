# .dotfiles

Personal dotfiles repository. 

This has evolved over the years. As for as I can I'm trying to keep this O/S
agnostic. 

# Manager

GNU `stow`. After having a look at a number of tools and managers, I'm still
going to stick with `stow`. It has some issues, but it's been around for some
time, and I don't foresee the project being abondoned anytime soon.

I'm not a fan of the _bare_ git repo approach to managing dotfiles. Call me
oldschool but the idea of the whole of `$HOME` being a git working directory
doesn't sit too well with me.


# Usage

## Installing

## Adding configurations

Use the `--adopt` option of `stow` to add a new configuration to the repository.

**Example: Add existing `neofetch` configuration to `.dotfiles`**

Create a new package in .dotfiles:
```
mkdir ~/.dotfiles/neofetch 
```

Locate the existing configuration file:
``` 
ls -l ~/.config/neofetch 
```

Create the directory structure in the package. `stow` will "unfold" the
directories if required:
```
mkdir -p ~/.dotfiles/neofetch/.config/neofetch
```

Create placeholder(s) for the existing file(s):
```
touch ~/.dotfiles/neofetch/.config/neofetch/config.conf
```

Adopt the configuration file(s) into the package:
```
stow --adopt -v neofetch
```

The switches are:

-n: With this option we are telling stow not to execute any action, just tell us
what it intends to do if we remove the option. 

`-v`: This option allow us to read what `stow` is doing. (verbosity level)

`--adopt`: This option modifies the stow directory. With this option it will 
move the current file in the target directory to the stow directory, and then 
create the link. 

`-n`: Is optional an can be used to do a _dry run_. Passing this option will
simulate what stow will perform.


# Credits

I have been collecting some of these snippets for over twenty years. Not very
many of them are my original work. Where I can remember who's repsonsible for
coming up with something I'll add a credit. If you come across something that
you think deserve a credit, get in touch. Otherwise thanks to the folks below:

- 
