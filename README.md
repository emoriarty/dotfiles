# .files

These are a basic dotfiles based on [webpro/dotfiles](https://github.com/webpro/dotfiles).
It installs brew, zsh with [antigen](https://github.com/zsh-users/antigen) and [vim](http://www.vim.org/).

## Package overview

* Core
  * [Homebrew](http://brew.sh/), [homebrew-cask](http://caskroom.io/)
  * zsh
  * [ndenv](https://github.com/riywo/ndenv)
  * brew
    * antigen
      * [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
    * git
    * git-extras
    * grep
    * macvim
    * tree
    * vim
    * wget
  * brew cask
    * firefox
    * google-chrome
    * google-drive
    * spotify
    * sublime-text
    * virtual-box
    * visual-studio-code
  

## Install

On a sparkling fresh installation of MacOS:
  sudo softwareupdate -i -a
  xcode-select --install 

### Clone with git

git clone https://github.com/webpro/dotfiles.git ~/.dotfiles
source ~/.dotfiles/install.sh

## Additional resources

  * [Awesome Dotfiles](https://github.com/webpro/awesome-dotfiles)
  * [Homebrew](http://brew.sh/) / [FAQ](https://github.com/Homebrew/homebrew/wiki/FAQ)
  * [homebrew-cask](http://caskroom.io/) / [usage](https://github.com/phinze/homebrew-cask/blob/master/USAGE.md)
  * [Bash prompt](http://wiki.archlinux.org/index.php/Color_Bash_Prompt)
  * [Solarized Color Theme for GNU ls](https://github.com/seebi/dircolors-solarized)		

## Credits

Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.: