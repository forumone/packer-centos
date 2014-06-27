mkdir /tmp/ruby && cd /tmp/ruby
curl ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz | tar xz
cd ruby-2.0.0-p481
./configure --disable-install-rdoc
make && make install
cd / && rm -fr /tmp/ruby
gem update --system