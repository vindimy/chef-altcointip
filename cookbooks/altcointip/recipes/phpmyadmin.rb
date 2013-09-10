#
# Cookbook Name:: altcointip
# Recipe:: phpmyadmin
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

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

