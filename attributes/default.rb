# Python information

default[:altcointip][:python_pips] = ['praw', 'sqlalchemy', 'mysql-python', 'pyyaml']


# Git information

default[:altcointip][:git_repos] = {
  'altcointip' => 'https://github.com/vindimy/altcointip.git',
  'pifkoin' => 'https://github.com/vindimy/pifkoin.git',
  'pyvircurex' => 'https://github.com/vindimy/pyvircurex.git'
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
