#
# Cookbook Name:: mlocate
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package 'mlocate' do
  action :install
  notifies :run, "execute[updatedb]", :immediately
end

execute 'updatedb' do
  command 'updatedb'
  action :nothing
end