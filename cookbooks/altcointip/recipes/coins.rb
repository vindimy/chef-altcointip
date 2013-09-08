#
# Cookbook Name:: altcointip
# Recipe:: coins
#
# Copyright 2013, vindimy@gmail.com
#
# All rights reserved - Do Not Redistribute
#

node[:altcointip][:coins].each do |coin|

  $altcointip_dir = "#{node[:altcointip][:install_dir]}/altcointip"
  $coin_dir = "#{$altcointip_dir}/coins/#{coin[:name]}-#{coin[:version]}"
  if coin[:enabled] && !File.directory?($coin_dir)

    directory $coin_dir do
      action :create
      recursive true
      user node[:altcointip][:user]
      group node[:altcointip][:group]
      mode "0755"
    end

    remote_file "#{$coin_dir}/#{coin[:file_name]}" do
      action :create_if_missing
      source coin[:file_source_url]
      checksum coin[:file_sha256sum]
      backup false
    end

    script "extract_coin" do
      action :run
      interpreter "bash"
      cwd $coin_dir
      code <<-EOH
      #{coin[:file_extract_cmd]} #{coin[:file_name]}
      EOH
    end

  end

  link "/usr/bin/#{coin[:name]}d" do
    to "#{$coin_dir}/#{coin[:daemon_path]}"
  end

  ruby_block "get_user_home_dir" do
    block do
      cmd = Chef::ShellOut.new("echo ~" + node[:altcointip][:user]}).run_command
      unless cmd.exitstatus == 0
        Chef::Application.fatal!("Failed to execute get_user_home_dir")
      end
      node[:altcointip][:user_home_dir] = cmd.stdout
    end
  end

  directory "#{node[:altcointip][:user_home_dir]}/.#{coin[:name]}" do
    action :create
    recursive false
    user node[:altcointip][:user]
    group node[:altcointip][:group]
    mode "0755"
  end

  template "#{node[:altcointip][:user_home_dir]}/.#{coin[:name]}/#{coin[:name]}.conf" do
    action :create
    backup false
    source "coin.conf.erb"
    variables(
      "rpcuser" => "#{coin[:name]}rpc"
      "rpcpassword" => coin[:rpcpassword]
      "rpcport" => coin[:rpcport]
    )
    user node[:altcointip][:user]
    group node[:altcointip][:group]
    mode "0640"
  end

end
