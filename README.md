# Install

```bash
$ cd $HOME
$ git clone git@github.com:cross-ts/dotfiles.git
$ cd dotfiles
$ bin/deploy
```

# Load order of each shell
## bash
1. /etc/profile
2. $HOME/.bash_profile
3. $HOME/.bashrc
4. /etc/bashrc

## zsh
1. /etc/zshenv
2. \${$ZDOTDIR:-$HOME}/.zshenv
3. /etc/zprofile
4. \${$ZDOTDIR:-$HOME}/.zprofile
5. \${$ZDOTDIR:-$HOME}/.zshrc
6. /etc/zlogin
7. \${$ZDOTDIR:-$HOME}/.zlogin
