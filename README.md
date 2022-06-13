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


## Git

Set credential helper to suit your environment.

### WSL2 / Windows Subsystem for Linux 2

Please, write in your git config file.

```bash
[credential]
  helper = manager
```

### Linux

```bash
$ curl -LO https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh && sh ./install-from-source.sh && git-credential-manager-core configure
$ export GCM_CREDENTIAL_STORE="gpg"
```

