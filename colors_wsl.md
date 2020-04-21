# Decent colors in WSL

## ANSI colors and databases

Recap on [ANSI](https://misc.flogisoft.com/bash/tip_colors_and_formatting) color codes.

At [jmcantrell](https://github.com/jmcantrell/dircolors) there is a very straightforward script to generate the database.

And [here](https://github.com/seebi/dircolors-solarized) there is a solarized database, and a folder with some examples of files.

Load the database with this in `~/.bash_aliases.local`

```bash
eval $(dircolors -b ~/path/to/database)
```

## WSL tweaks

### Prompt

To set path color to yellow, put this in `~/.bash_aliases.local`
```
#                                                    this is the start of the path |             | and here is reset
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
#                          start of the host name |                | reset here
```

We have 256 colors support, so lets make it a little gentler copying the codes from solarized elements:

```
# Cyan and Blue
LINK 00;38;5;37 # symbolic link
DIR 00;38;5;33 # directory

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;38;5;37m\]\u@\h\[\033[00m\]:\[\033[00;38;5;33m\]\w\[\033[00m\]\$ '
```                         

```
# Tan and Ocra
.ogg    00;38;5;166
.png    00;38;5;136
PS1='${debian_chroot:+($debian_chroot)}\[\033[00;38;5;166m\]\u@\h\[\033[00m\]:\[\033[00;38;5;136m\]\w\[\033[00m\]\$ '
```

### EXA

Exa has great colors, except for dark blue on black, that is unreadable. And bold yellow, that is blinding.

Clone the exa repo, install rust, and modify the source code.

Inside `style/colours.rs` there is a magic `impl Colours` thing (I don't know rust) where from what I gathered elements are mapped to colors. Lets change this:

```
git: Git {
    modified:    Cyan.bold(),
},
date:         Cyan.normal(),
```

For mysterious reasons, `directory:    Blue.bold(),` does not suck, so there is no need to change that.

Open the makefile and change the prefix

```
PREFIX = /home/pietro/temp
```

Then create the `~/temp/bin` folder where the executable will be put, build with `make install-exa`, check the results and move it in `~/.local/bin`.

Useful `grep -r bold data Blue` to find where some settings are.

### Background

Set it to (33, 33, 33), no need for a black void.
