#
# Cookbook Name:: wolfer-init
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "yum update" do
  command "yum update -y"
  action :run
end

execute "yum groupinstall Development Tools" do
  command "yum groupinstall 'Development Tools' -y"
end

package 'mlocate' do
  action :install
  notifies :run, "execute[updatedb]", :immediately
end

execute 'updatedb' do
  command 'updatedb'
  action :nothing
end
