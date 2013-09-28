#
# Cookbook Name:: altcointip
# Recipe:: default
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

# Install Python

include_recipe "python"

node[:altcointip][:python_pips].each do |pip|
  python_pip pip do
    action :install
  end
end


# Create altcointip Linux user and group

group node[:altcointip][:user_group] do
  action :create
  append true
end

user node[:altcointip][:user] do
  action :create
  home node[:altcointip][:user_home_dir]
  gid node[:altcointip][:user_group]
  shell "/bin/bash"
  system false
  password node[:altcointip][:user_password]
  supports :manage_home => false
end


# Install cryptocoins

directory ::File.join(node[:altcointip][:install_dir], 'coins') do
  action :create
  mode '0755'
  user node[:altcointip][:user]
  group node[:altcointip][:group]
  recursive true
end

::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
include_recipe "crypto-coin::default"

node[:altcointip][:cryptocoins].each do |key,coin|

  if coin[:enabled]

    node.set_unless[:altcointip][:cryptocoins]["#{coin[:name]}"][:rpcpassword] = secure_password

    if coin[:extra_packages]
      coin[:extra_packages].each do |pkg|
        package pkg
      end
    end

    crypto_coin coin[:name] do
      repository    coin[:git_repo]
      revision      coin[:revision]
      port          coin[:rpcport]
      rpcpassword   node[:altcointip][:cryptocoins]["#{coin[:name]}"][:rpcpassword]
      group         node[:altcointip][:user_group]
      home          ::File.join(node[:altcointip][:install_dir], 'coins', coin[:name])
    end

    service coin[:name] do
      provider Chef::Provider::Service::Upstart
      action coin[:autostart] ? :start : :nothing
    end

  end

end


# Set up altcointip

include_recipe "git"

$altcointip_dir = node[:altcointip][:install_dir]
unless File.directory?("#{$altcointip_dir}/altcointip")

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

  # Set up config.yml if it doesn't exist
  script "set_up_config" do
    action :run
    interpreter "bash"
    not_if File.file?("#{$altcointip_dir}/altcointip/src/config.yml")
    cwd $altcointip_dir
    user node[:altcointip][:user]
    code <<-EOH
    cp #{$altcointip_dir}/altcointip/src/sample-config.yml #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's mysqldb #{node[:altcointip][:mysql_db_name]} g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's mysqluser #{node[:altcointip][:mysql_username]} g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's mysqlpass #{node[:altcointip][:mysql_password]} g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's mybotuser #{node[:altcointip][:reddit_username]} g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's mybotpass #{node[:altcointip][:reddit_password]} g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's ~/.bitcoin/bitcoin.conf #{$altcointip_dir}/coins/bitcoin/bitcoin.conf g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's ~/.litecoin/litecoin.conf #{$altcointip_dir}/coins/litecoin/litecoin.conf g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's ~/.namecoin/bitcoin.conf #{$altcointip_dir}/coins/namecoin/namecoin.conf g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's ~/.ppcoin/ppcoin.conf #{$altcointip_dir}/coins/ppcoin/ppcoin.conf g' #{$altcointip_dir}/altcointip/src/config.yml
    sed -i 's ~/.primecoin/primecoin.conf #{$altcointip_dir}/coins/primecoin/primecoin.conf g' #{$altcointip_dir}/altcointip/src/config.yml
    EOH
  end

end


# Manage crontab entries

node[:altcointip][:cron].each do |key, job|

  cron key do
    action job[:enabled] ? :create : :delete
    user node[:altcointip][:user]
    minute job[:minute]
    hour job[:hour]
    day job[:day]
    month job[:month]
    weekday job[:weekday]
    user node[:altcointip][:user]
    command job[:command]
  end

end
