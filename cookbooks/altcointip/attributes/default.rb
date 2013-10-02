# Python information

default[:altcointip][:python_pips] = ['praw', 'sqlalchemy', 'mysql-python', 'pyyaml']


# Git information

default[:altcointip][:git_repos] = {
  'altcointip' => 'https://github.com/vindimy/altcointip.git',
  'pifkoin' => 'https://github.com/vindimy/pifkoin.git',
  'pyvircurex' => 'https://github.com/vindimy/pyvircurex.git'
}


# Cryptocoin information

default[:altcointip][:cryptocoins] = {
  :bitcoin => {
    :enabled => false,
    :name => 'bitcoin',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/bitcoin/bitcoin.git',
    :revision => '0.8.5',
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
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/litecoin-project/litecoin.git',
    :revision => 'v0.8.5.1',
    :file_name => 'litecoin-0.8.4.1-linux.tar.xz',
    :file_source_url => 'https://litecoin.org/downloads/linux/litecoin-0.8.4.1-linux.tar.xz',
    :file_sha256sum => 'f7ba4ad33ba73912a3e097bad6e42452788f69c3ca0af6d57a20dfddb73df2d3',
    :file_extract_cmd => 'tar --strip-components=1 -Jxf',
    :file_daemon_path => 'bin/64/litecoind',
    :rpcport => 19332,
    :port => 19333
  },
  :ppcoin => {
    :enabled => false,
    :name => 'ppcoin',
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/ppcoin/ppcoin.git',
    :revision => 'v0.3.0ppc',
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
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/namecoin/namecoin.git',
    :extra_packages => ['libglibmm-2.4-dev'],
    :revision => 'nc0.3.51.00',
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
    :autostart => false,
    :method => 'git',
    :git_repo => 'https://github.com/primecoin/primecoin.git',
    :revision => 'v0.1.2xpm',
    :file_name => 'primecoin-0.1.1-linux.tar.gz',
    :file_source_url => 'http://sourceforge.net/projects/primecoin/files/0.1.1/primecoin-0.1.1-linux.tar.gz/download',
    :file_sha256sum => 'e9c2a34ddf6806924139ac5a1294f0e24f7480604773faaf79df58dc394f1594',
    :file_extract_cmd => 'tar --strip-components=1 -zxf',
    :file_daemon_path => 'bin/64/primecoind',
    :rpcport => 18772,
    :port => 18773
  }
}



# Linux information

default[:altcointip][:user] = 'altcointip'
# To specify password, use the following command to get encrypted value:
# openssl passwd -1 'mypassword'
default[:altcointip][:user_password] = '$1$5AtcQt.F$a3SJhl/KHt1sfoJhndGza0'
default[:altcointip][:user_group] = 'altcointip'
default[:altcointip][:user_home_dir] = '/opt/altcointip'

default[:altcointip][:install_dir] = '/opt/altcointip'


# MySQL information

default[:altcointip][:mysql_db_name] = 'altcointip'
default[:altcointip][:mysql_username] = 'altcointip'
default[:altcointip][:mysql_password] = 'altcointip123'


# Reddit information

default[:altcointip][:reddit_username] = 'myaltcointip'
default[:altcointip][:reddit_password] = 'myaltcointip123'


# cron information

default[:altcointip][:cron] = {
  'stats' => {
    :enabled => false,
    :minute => '0',
    :hour => '*/3',
    :day => '*',
    :month => '*',
    :weekday => '*',
    :command => "cd #{node[:altcointip][:install_dir]}/altcointip/src && python _update_stats.py"
  },
  'backup_db' => {
    :enabled => false,
    :minute => '0',
    :hour => '8,20',
    :day => '*',
    :month => '*',
    :weekday => '*',
    :command => "cd #{node[:altcointip][:install_dir]}/altcointip/src && python _backup_db.py ~/backups"
  },
  'backup_wallets' => {
    :enabled => false,
    :minute => '0',
    :hour => '9,21',
    :day => '*',
    :month => '*',
    :weekday => '*',
    :user => 'root',
    :command => "cd #{node[:altcointip][:install_dir]}/altcointip/src && python _backup_wallets.py ~/backups"
  },
  'backup_config' => {
    :enabled => false,
    :minute => '0',
    :hour => '10',
    :day => '*',
    :month => '*',
    :weekday => '*',
    :command => "cd #{node[:altcointip][:install_dir]}/altcointip/src && python _backup_config.py ~/backups"
  }
}
