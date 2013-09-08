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


# Install Apache and phpmyadmin

include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_php5"
include_recipe "phpmyadmin"

directory node[:altcointip][:www_root_dir] do
  action :create
  recursive true
  user node[:altcointip][:user]
  group node[:altcointip][:group]
  mode "0755"
end  

web_app "altcointip" do
  server_name node['hostname']
  server_aliases [node['fqdn']]
  docroot node[:altcointip][:www_root_dir]
end

link "#{node[:altcointip][:www_root_dir]}/pma" do
  to "/opt/phpmyadmin"
end


# Set up altcointip and MySQL

include_recipe "git"

$altcointip_dir = "#{node[:altcointip][:install_dir]}/altcointip"
unless File.directory?($altcointip_dir)

  directory $altcointip_dir do
    action :create
    recursive true
    user node[:altcointip][:user]
    group node[:altcointip][:group]
    mode "0750"
  end

  # Clone Git repositories

  script "git_clone" do
    action :run
    interpreter "bash"
    cwd $altcointip_dir
    code <<-EOH
    git clone #{node[:altcointip][:git_repo_addr][:altcointip]} #{$altcointip_dir}/altcointip || exit 1
    git clone #{node[:altcointip][:git_repo_addr][:pifkoin]} #{$altcointip_dir}/pifkoin || exit 1
    git clone #{node[:altcointip][:git_repo_addr][:pyvircurex]} #{$altcointip_dir}/pyvircurex || exit 1
    EOH
  end

  link "#{$altcointip_dir}/altcointip/src/pifkoin" do
    to "#{$altcointip_dir}/pifkoin/python"
  end

  link "#{$altcointip_dir}/altcointip/src/ctb/pyvircurex" do
    to "#{$altcointip_dir}/pyvircurex/vircurex"
  end

  # Set up MySQL

  mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}

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
    privileges [:select,:update,:insert]
    action :grant
  end

  # Set up config.yml
  script "set_up_config" do
    action :run
    interpreter "bash"
    cwd $altcointip_dir
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
