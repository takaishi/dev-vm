sudo apt-get -y update
sudo apt-get -y install git vim zsh tmux emacs tig libssl-dev libreadline-dev zlib1g-dev

sudo su - vagrant

git config --global user.email 'ryo.takaishi@gmail.com'
git config --global user.name 'r_takaishi'

# Setup rbenv
if [ ! -e '/home/vagrant/.rbenv' ]; then
 git clone https://github.com/rbenv/rbenv.git ~/.rbenv
 git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
 echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
 echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
 source ~/.bash_profile
 rbenv install 2.3.0
 rbenv global 2.3.0
 gem install bundler
fi

# Setup dotfiles
if [ ! -e '/home/vagrant/.homesick' ]; then
 gem install homesick
 homesick clone https://github.com/takaishi/dotfiles_castle.git
 homesick link dotfiles_castle
fi

# change shell
sudo chsh -s /bin/zsh vagrant

