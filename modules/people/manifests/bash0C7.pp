class people::bash0C7 {
  # Puppetfile で定義したもの
  include chrome
  include dropbox
  include skype
  include things
  include phpstorm
  include wget
  include iterm2::stable
  include sourcetree
  include firefox
  include java
  include netbeans::php

  # https://github.com/boxen/puppet-keyremap4macbook
  include keyremap4macbook
  include keyremap4macbook::login_item

  # homebrew でインストールするもの
  package {
    [
      'tmux',
      'tree',
    ]:
  }

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  file { $home:
    ensure  => directory
  }

#  # git clone git@github.com:sonots/dotfiles.git
#  repository { $dotfiles:
#    source  => 'sonots/dotfiles',
#    require => File[$home]
#  }

  # git-cloneしたら install.sh を走らせる
#  exec { "sh ${dotfiles}/install.sh":
#    cwd => $dotfiles,
#    creates => "${home}/.zshrc",
#    require => Repository[$dotfiles],
#  }
}