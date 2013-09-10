# Python information

default[:altcointip][:python_pips] = ["praw", "sqlalchemy", "mysql-python", "pyyaml"]


# Git information

default[:altcointip][:git_repo_addr] = {
  "altcointip" => "https://github.com/vindimy/altcointip.git",
  "pifkoin" => "https://github.com/dpifke/pifkoin.git",
  "pyvircurex" => "https://github.com/christopherpoole/pyvircurex.git"
}


# Linux information

default[:altcointip][:user] = "altcointip"
default[:altcointip][:user_home_dir] = "/opt/altcointip"
default[:altcointip][:group] = "altcointip"
default[:altcointip][:install_dir] = "/opt/altcointip"


# MySQL information

default[:altcointip][:mysql_db_name] = "altcointip"
default[:altcointip][:mysql_username] = "altcointip"
default[:altcointip][:mysql_password] = "altcointip123"


# Reddit information

default[:altcointip][:reddit_username] = "myaltcointip"
default[:altcointip][:reddit_password] = "myaltcointip123"


# cron information

default[:altcointip][:cron] = {
  "stats" => {
    "enabled" => false,
    "minute" => "0",
    "hour" => "*/3",
    "day" => "*",
    "month" => "*",
    "weekday" => "*"
  },
  "backup_db" => {
    "enabled" => false,
    "minute" => "0",
    "hour" => "8,20",
    "day" => "*",
    "month" => "*",
    "weekday" => "*",
    "local_dir" => "~/backups",
    "remote_dir" => ""
  },
  "backup_wallets" => {
    "enabled" => false,
    "minute" => "0",
    "hour" => "9,21",
    "day" => "*",
    "month" => "*",
    "weekday" => "*",
    "local_dir" => "~/backups",
    "remote_dir" => ""
  }
}
