# dotfiles

## Preparation

```bash
$ sudo apt update && sudo apt install -y curl git procps build-essential
$ sudo apt-add-repository -y ppa:fish-shell/release-3
$ sudo apt-get update && sudo apt-get install -y fish
```

and install fish package manager.

```bash
$ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```


### Brew

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### fzf

```bash
$ brew install fzf
```

#### Neovim

```bash
$ brew install neovim
````

#### Starship

```bash
$ brew install starship
```

#### Direnv

```bash
$ brew install direnv
```
