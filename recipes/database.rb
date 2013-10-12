#
# Cookbook Name:: altcointip
# Recipe:: database
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

# Install MySQL

include_recipe "mysql::server"
include_recipe "mysql::client"
include_recipe "database::mysql"


# Configure MySQL

include_recipe "git"

$altcointip_dir = node[:altcointip][:install_dir]
unless File.directory?($altcointip_dir) and File.file?(File.join($altcointip_dir, 'mysql_db_created'))

  directory $altcointip_dir do
    action :create
    recursive true
    user node[:altcointip][:user]
    group node[:altcointip][:user_group]
    mode "0755"
  end

  # Clone Git repository

  unless File.directory?(File.join($altcointip_dir, 'altcointip'))
    script "git_clone" do
      action :run
      interpreter "bash"
      cwd $altcointip_dir
      user node[:altcointip][:user]
      code <<-EOH
      git clone #{node[:altcointip][:git_repos][:altcointip]} #{$altcointip_dir}/altcointip || exit 1
      EOH
    end
  end

  # Set up database

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

  file ::File.join($altcointip_dir, 'mysql_db_created') do
    action :create
  end

end
