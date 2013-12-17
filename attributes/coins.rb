# Cryptocoin information

default[:altcointip][:cryptocoins] = {
  :bitcoin => {
    :enabled => false,
    :name => 'bitcoin',
    :executable => 'bitcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/bitcoin/bitcoin.git',
    :git_revision => '0.8.5',
    :file_name => 'bitcoin-0.8.4-linux.tar.gz',
    :file_source_url => 'http://sourceforge.net/projects/bitcoin/files/Bitcoin/bitcoin-0.8.4/bitcoin-0.8.4-linux.tar.gz/download',
    :file_sha256sum => 'cd746a4ab3b656e41e3f09722a7336fb978eb726bae55591314f1dad60759ecc',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/bitcoind',
    :rpcport => 18332,
    :port => 18333
  },
  :litecoin => {
    :enabled => false,
    :name => 'litecoin',
    :executable => 'litecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/litecoin-project/litecoin.git',
    :git_revision => 'v0.8.6.1',
    :file_name => 'litecoin-0.8.6.1-linux.tar.xz',
    :file_source_url => 'https://litecoin.org/downloads/linux/litecoin-0.8.6.1-linux.tar.xz',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -Jxf',
    :file_daemon_path => 'bin/64/litecoind',
    :rpcport => 19332,
    :port => 19333
  },
  :ppcoin => {
    :enabled => false,
    :name => 'ppcoin',
    :executable => 'ppcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/ppcoin/ppcoin.git',
    :git_revision => 'v0.3.0ppc',
    :file_name => 'ppcoin-0.3.0-linux.tar.gz',
    :file_source_url => 'http://sourceforge.net/projects/ppcoin/files/0.3.0/ppcoin-0.3.0-linux.tar.gz/download',
    :file_sha256sum => '919bb1c60eeebdd173ddcd4c83264f745bbf2af29410ded062f6c6bfce44f694',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/ppcoind',
    :rpcport => 19902,
    :port => 19903
  },
  :namecoin => {
    :enabled => false,
    :name => 'namecoin',
    :executable => 'namecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/namecoin/namecoin.git',
    :git_revision => 'nc0.3.51.00',
    :extra_packages => ['libglibmm-2.4-dev','libglib2.0-dev'],
    :file_name => 'namecoin_linux64.tgz',
    :file_source_url => 'http://dot-bit.org/files/namecoin_linux64.tgz',
    :file_sha256sum => '2ecd4a17d1c301da3dc60e60af189690a8e7abb1b83fdabbfb4c2951e25bc2ec',
    :file_extract_cmd => 'tar -zxf',
    :file_daemon_path => 'namecoind',
    :rpcport => 18336,
    :port => 18337
  },
  :primecoin => {
    :enabled => false,
    :name => 'primecoin',
    :executable => 'primecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/primecoin/primecoin.git',
    :git_revision => 'v0.1.2xpm',
    :file_name => 'primecoin-0.1.1-linux.tar.gz',
    :file_source_url => 'http://sourceforge.net/projects/primecoin/files/0.1.1/primecoin-0.1.1-linux.tar.gz/download',
    :file_sha256sum => 'e9c2a34ddf6806924139ac5a1294f0e24f7480604773faaf79df58dc394f1594',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/primecoind',
    :rpcport => 18772,
    :port => 18773
  },
 :feathercoin => {
    :enabled => false,
    :name => 'feathercoin',
    :executable => 'feathercoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/FeatherCoin/FeatherCoin.git',
    :git_revision => 'v0.6.4.4',
    :file_name => 'feathercoin-0.6.4.4-linux.tar.gz',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/feathercoind',
    :rpcport => 19336,
    :port => 19337
  },
 :megacoin => {
    :enabled => false,
    :name => 'megacoin',
    :executable => 'megacoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/megacoin/megacoin.git',
    :git_revision => '0.8-mega-core-theme-0.8.996',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/megacoind',
    :rpcport => 17950,
    :port => 17951
  },
 :ixcoin => {
    :enabled => false,
    :name => 'ixcoin',
    :executable => 'ixcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/ixcoin/ixcoin.git',
    :git_revision => 'master',
    :extra_packages => ['libglibmm-2.4-dev','libglib2.0-dev'],
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/ixcoind',
    :rpcport => 18338,
    :port => 18339
  },
 :i0coin => {
    :enabled => false,
    :name => 'i0coin',
    :executable => 'i0coind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/rsnel/i0coin.git',
    :git_revision => 'i0coin-0.8.6-1',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/i0coind',
    :rpcport => 17332,
    :port => 17333
  },
 :bbqcoin => {
    :enabled => false,
    :name => 'bbqcoin',
    :executable => 'bbqcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/overware/BBQCoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/bbqcoind',
    :rpcport => 59332,
    :port => 59333
  },
 :digitalcoin => {
    :enabled => false,
    :name => 'digitalcoin',
    :executable => 'digitalcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/baritus/digitalcoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/digitalcoind',
    :rpcport => 17998,
    :port => 17999
  },
 :securecoin => {
    :enabled => false,
    :name => 'securecoin',
    :executable => 'securecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/securecoin/Securecoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/securecoind',
    :rpcport => 12567,
    :port => 12568
  },
 :stablecoin => {
    :enabled => false,
    :name => 'stablecoin',
    :executable => 'stablecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/stablecoin/stablecoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/stablecoind',
    :rpcport => 17501,
    :port => 17502
  },
 :infinitecoin => {
    :enabled => false,
    :name => 'infinitecoin',
    :executable => 'infinitecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/infinitecoin/infinitecoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/infinitecoind',
    :rpcport => 19321,
    :port => 19322
  },
 :mincoin => {
    :enabled => false,
    :name => 'mincoin',
    :executable => 'mincoin',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/vipah/mincoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/mincoind',
    :rpcport => 19335,
    :port => 19336
  },
 :quarkcoin => {
    :enabled => false,
    :name => 'quarkcoin',
    :executable => 'quarkcoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/MaxGuevara/quark.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/quarkcoind',
    :rpcport => 19998,
    :port => 19999
  },
 :zetacoin => {
    :enabled => false,
    :name => 'zetacoin',
    :executable => 'zetacoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/zetacoin/zetacoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/zetacoind',
    :rpcport => 17335,
    :port => 17336
  },
 :yacoin => {
    :enabled => false,
    :name => 'yacoin',
    :executable => 'yacoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/yacoin/yacoin.git',
    :git_revision => 'stable_0.4.0',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/yacoind',
    :rpcport => 19323,
    :port => 19324
  },
 :dogecoin => {
    :enabled => false,
    :name => 'dogecoin',
    :executable => 'dogecoind',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/dogecoin/dogecoin.git',
    :git_revision => 'master',
    :file_name => '',
    :file_source_url => '',
    :file_sha256sum => '',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/dogecoind',
    :rpcport => 22555,
    :port => 22556
  }
}
