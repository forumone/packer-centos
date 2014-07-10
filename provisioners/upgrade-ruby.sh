yum -q -y makecache
yum -y install git openssl-devel

git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
mkdir -p /usr/local/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/ruby.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/ruby.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/ruby.sh
echo 'rbenv install 2.0.0-p481'
source /etc/profile.d/ruby.sh; rbenv install 2.0.0-p481 -v
echo 'rbenv global 2.0.0-p481'
source /etc/profile.d/ruby.sh; rbenv global 2.0.0-p481
echo 'rbenv rehash'
source /etc/profile.d/ruby.sh; rbenv rehash
source /etc/profile.d/ruby.sh; gem install librarian-puppet --no-ri --no-rdoc
source /etc/profile.d/ruby.sh; gem install puppet --no-ri --no-rdoc