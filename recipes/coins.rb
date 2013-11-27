#
# Cookbook Name:: altcointip
# Recipe:: coins
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

# Install cryptocoins

directory File.join(node[:altcointip][:install_dir], 'coins') do
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
      repository       coin[:git_repo]
      revision         coin[:revision]
      port             coin[:port]
      rpcport          coin[:rpcport]
      rpcpassword      node[:altcointip][:cryptocoins]["#{coin[:name]}"][:rpcpassword]
      group            coin[:group] || node[:altcointip][:user_group]
      home             File.join(node[:altcointip][:install_dir], 'coins', coin[:name])
      respawn_times    '1'
      respawn_seconds  '60'
    end

    service coin[:name] do
      provider Chef::Provider::Service::Upstart
      action coin[:autostart] ? :start : :nothing
    end

    # Relax file permissions

    file "/opt/crypto_coins/#{coin[:name]}/src/#{coin[:name]}d" do
      mode '0755'
    end

    file "#{node[:altcointip][:install_dir]}/coins/#{coin[:name]}/#{coin[:name]}.conf" do
      mode '0644'
    end

  end

end

template '/etc/profile.d/coin_alias.sh' do
  source 'coin_alias.sh.erb'
  backup false
  user 'root'
  group 'root'
  mode '0755'
  variables({
    :coins => node[:altcointip][:cryptocoins]
  })
end

