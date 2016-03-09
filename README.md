# Dot Files

These are config files to set up a system the way I like it.

## Installation

```sh
git clone git://github.com/lexmag/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

## Environment

I am running on Mac OS X, but it will likely work on Linux as well with
minor fiddling. I primarily use zsh. To switch to zsh, you can do so with
the following command:

```sh
chsh -s /bin/zsh
```

## Features

I normally place all of my coding projects in `~/Code`, so this directory
can easily be accessed (and tab completed) with the `c` command:

```sh
c dotfi<tab>
```

There is also an `h` command which behaves similarly, but acts on the
home path:

```sh
h Down<tab>
```

Also there is an `s` command which is shortcut for `subl`.
Just `s` without operand behaves same as `subl .`.

Tab completion is also added to `mix` command:

```sh
mix te<tab>
```

To speed things up, the results are cached in local `.mix_tasks~` file.
It is smart enough to expire the cache automatically in
most cases, but you can simply remove the file to flush the cache.

There are a few key bindings set. Many of these require option to be
set as the meta key. Option-left/right arrow will move cursor by word,
and control-left/right will move it to beginning/end of line.
A new tab will open with the current directory under Mac OS X Terminal.

If you're using `git`, you'll notice the current branch name shows up in
the prompt while in a `git` repository.

[There are also several `git` aliases included](https://github.com/lexmag/dotfiles/blob/master/gitconfig.erb#L12-L17).
See the other aliases in `~/.zsh/aliases`

If there are some shell configuration settings which you want secure or
specific to one system, place it into `~/.localrc` file. This will be
loaded automatically if it exists.
