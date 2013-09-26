#
# Cookbook Name:: altcointip
# Recipe:: default
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

# Install MySQL

include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database::mysql"


# Install Python

include_recipe "python"

node[:altcointip][:python_pips].each do |pip|
  python_pip pip do
    action :install
  end
end


# Install Cryptocoins

node[:altcointip][:cryptocoins].each do |coin|
  include_recipe "#{coin[:name]}"
end


# Create altcointip Linux user and group

user node[:altcointip][:user] do
  action :create
  home node[:altcointip][:user_home_dir]
  gid node[:altcointip][:user_group]
  shell "/bin/bash"
  system false
  password node[:altcointip][:user_password]
  supports :manage_home => false
end

group node[:altcointip][:user_group] do
  action :create
  append :true
  members node[:altcointip][:user]
end


# Set up altcointip and MySQL

include_recipe "git"

$altcointip_dir = node[:altcointip][:install_dir]
unless File.directory?($altcointip_dir)

  directory $altcointip_dir do
    action :create
    recursive true
    user node[:altcointip][:user]
    group node[:altcointip][:user_group]
    mode "0755"
  end

  # Clone Git repositories

  script "git_clone" do
    action :run
    interpreter "bash"
    cwd $altcointip_dir
    user node[:altcointip][:user]
    code <<-EOH
    git clone #{node[:altcointip][:git_repos][:altcointip]} #{$altcointip_dir}/altcointip || exit 1
    git clone #{node[:altcointip][:git_repos][:pifkoin]} #{$altcointip_dir}/pifkoin || exit 1
    git clone #{node[:altcointip][:git_repos][:pyvircurex]} #{$altcointip_dir}/pyvircurex || exit 1
    EOH
  end

  link "#{$altcointip_dir}/altcointip/src/pifkoin" do
    to "#{$altcointip_dir}/pifkoin/python"
    owner node[:altcointip][:user]
  end

  link "#{$altcointip_dir}/altcointip/src/ctb/pyvircurex" do
    to "#{$altcointip_dir}/pyvircurex/vircurex"
    owner node[:altcointip][:user]
  end

  # Set up MySQL

  mysql_connection_info = {:host => 'localhost', :username => 'root', :password => node[:mysql][:server_root_password]}

  # Create database
  mysql_database node[:altcointip][:mysql_db_name] do
    connection mysql_connection_info
    action :create
  end

  # Create tables
  mysql_database node[:altcointip][:mysql_db_name] do
    connection mysql_connection_info
    sql { ::File.open("#{$altcointip_dir}/altcointip/altcointip.sql").read }
    action :query
  end

  # Create user
  mysql_database_user node[:altcointip][:mysql_username] do
    connection mysql_connection_info
    password node[:altcointip][:mysql_password]
    action :create
  end

  # Grant privileges to user
  mysql_database_user node[:altcointip][:mysql_username] do
    connection mysql_connection_info
    password node[:altcointip][:mysql_password]
    database_name node[:altcointip][:mysql_db_name]
    host '%'
    privileges [:all]
    action :grant
  end

  # Set up config.yml if it doesn't exist
  script "set_up_config" do
    action :run
    interpreter "bash"
    not_if File.file?("#{$altcointip_dir}/altcointip/src/config.yml")
    cwd $altcointip_dir
    user node[:altcointip][:user]
    code <<-EOH
    cp #{$altcointip_dir}/altcointip/src/sample-config.yml #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's/mysqldb/#{node[:altcointip][:mysql_db_name]}/g' #{$altcointip_dir}/altcointip/src/config.yml || exit 1
    sed -i 's/mysqluser/#{node[:altcointip][:mysql_username]}/g' #{$altcointip_dir}/altcointip/src/config.yml || exit 1
    sed -i 's/mysqlpass/#{node[:altcointip][:mysql_password]}/g' #{$altcointip_dir}/altcointip/src/config.yml || exit 1
    sed -i 's/mybotuser/#{node[:altcointip][:reddit_username]}/g' #{$altcointip_dir}/altcointip/src/config.yml || exit 1
    sed -i 's/mybotpass/#{node[:altcointip][:reddit_password]}/g' #{$altcointip_dir}/altcointip/src/config.yml || exit 1
    EOH
  end

end


# Create crontab entries, if configured

cron "update_stats" do
  action node[:altcointip][:cron][:stats][:enabled] ? :create : :delete
  user node[:altcointip][:user]
  minute node[:altcointip][:cron][:stats][:minute]
  hour node[:altcointip][:cron][:stats][:hour]
  day node[:altcointip][:cron][:stats][:day]
  month node[:altcointip][:cron][:stats][:month]
  weekday node[:altcointip][:cron][:stats][:weekday]
  user node[:altcointip][:user]
  command "cd #{$altcointip_dir}/altcointip/src && python _update_stats.rb >/dev/null 2>&1"
end

cron "backup_db" do
  action node[:altcointip][:cron][:backup_db][:enabled] ? :create : :delete
  user node[:altcointip][:user]
  minute node[:altcointip][:cron][:backup_db][:minute]
  hour node[:altcointip][:cron][:backup_db][:hour]
  day node[:altcointip][:cron][:backup_db][:day]
  month node[:altcointip][:cron][:backup_db][:month]
  weekday node[:altcointip][:cron][:backup_db][:weekday]
  user node[:altcointip][:user]
  command "cd #{$altcointip_dir}/altcointip/src && python _backup_db.rb #{node[:altcointip][:cron][:backup_db][:local_dir]} #{node[:altcointip][:cron][:backup_db][:remote_dir]} >/dev/null 2>&1"
end

cron "backup_wallets" do
  action node[:altcointip][:cron][:backup_wallets][:enabled] ? :create : :delete
  user node[:altcointip][:user]
  minute node[:altcointip][:cron][:backup_wallets][:minute]
  hour node[:altcointip][:cron][:backup_wallets][:hour]
  day node[:altcointip][:cron][:backup_wallets][:day]
  month node[:altcointip][:cron][:backup_wallets][:month]
  weekday node[:altcointip][:cron][:backup_wallets][:weekday]
  user node[:altcointip][:user]
  command "cd #{$altcointip_dir}/altcointip/src && python _backup_wallets.rb #{node[:altcointip][:cron][:backup_wallets][:local_dir]} #{node[:altcointip][:cron][:backup_wallets][:remote_dir]} >/dev/null 2>&1"
end
