# bd
Easily travel up your current path without using cd ../../..

## Acknowledgements

This is a reimplementation of [zsh-bd](https://github.com/Tarrasch/zsh-bd). It exapands on this project by adding more robust zsh completion, better performance, and following plugin best practices.

## Usage

Usage is simple, `bd` accepts a single argument. The argument specifies which directory to which you want to travel up your directory tree. It can either be the name of a parent directory or the number of levels up you want to go up. Completion is also included and setup to work with your configured [`matcher-list`](https://zsh-manual.netlify.app/completion-widgets?highlight=matcher-list#195-completion-matching-control).

Below is an example:

```shell
❯ # Setup the example
❯ pwd
/tmp/bd_example
❯ mkdir -p a/b/c/d/1/2/3/4
❯ llt
drwxr-xr-x - jlyle wheel 2024-05-10 14:43 .
drwxr-xr-x - jlyle wheel 2024-05-10 14:43 └── a
drwxr-xr-x - jlyle wheel 2024-05-10 14:43    └── b
drwxr-xr-x - jlyle wheel 2024-05-10 14:43       └── c
drwxr-xr-x - jlyle wheel 2024-05-10 14:43          └── d
drwxr-xr-x - jlyle wheel 2024-05-10 14:43             └── 1
drwxr-xr-x - jlyle wheel 2024-05-10 14:43                └── 2
drwxr-xr-x - jlyle wheel 2024-05-10 14:43                   └── 3
drwxr-xr-x - jlyle wheel 2024-05-10 14:43                      └── 4
❯ cd /tmp/bd_example/a/b/c/d/1/2/3/4
❯ # Go up to a named directory
❯ bd bd_example
❯ pwd
/tmp/bd_example
❯ cd /tmp/bd_example/a/b/c/d/1/2/3/4
❯ # Go up 6 directories
❯ bd 6
❯ pwd
/tmp/bd_example/a/b
❯ cd /tmp/bd_example/a/b/c/d/1/2/3/4
❯ # Go up only 1 directory because 3 is the name of a directory
❯ bd 3
❯ pwd
/tmp/bd_example/a/b/c/d/1/2/3
```

## Requirements
- ZSH Shell

## Installation

### Manual installation
```shell
git clone 'https://github.com/jasonlyle88/bd' "${XDG_CONFIG_HOME:-${HOME}}/bd"
echo 'source "${XDG_CONFIG_HOME:-${HOME}}/bd/bd.plugin.zsh"' >> "${ZDOTDIR:-${HOME}}/.zshrc"
source "${XDG_CONFIG_HOME:-${HOME}}/bd/bd.plugin.zsh"
```

### Installation with package managers

#### [Antidote](https://getantidote.github.io/)
Add `jasonlyle88/bd` to your plugins file (default is `~/.zsh_plugins.txt`)

#### [Oh-My-Zsh](https://ohmyz.sh/)
```shell
git clone 'https://github.com/jasonlyle88/bd' "${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins/bd"
omz plugin enable bd
```

#### Others
This should be compatible with other ZSH frameworks/package managers, but I have not tested them. If you have tested this plugin with another package manager, feel free to create a merge request and add the instructions here!
