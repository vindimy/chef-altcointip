default[:altcointip][:python_pips] = ["praw", "sqlalchemy", "mysql-python", "pyyaml"]

default[:altcointip][:git_repo_addr] = {
  "altcointip" => "https://github.com/vindimy/altcointip.git",
  "pifkoin" => "https://github.com/dpifke/pifkoin.git",
  "pyvircurex" => "https://github.com/christopherpoole/pyvircurex.git"
}

# Linux information

default[:altcointip][:user] = "root"
default[:altcointip][:group] = "root"
default[:altcointip][:install_dir] = "/opt"


# MySQL information

default[:altcointip][:mysql_db_name] = "altcointip"
default[:altcointip][:mysql_username] = "altcointip"
default[:altcointip][:mysql_password] = "altcointip123"


# Reddit information

default[:altcointip][:reddit_username] = "myaltcointip"
default[:altcointip][:reddit_password] = "myaltcointip123"


# httpd information

default[:altcointip][:www_root_dir] = "/var/www/altcointip"
