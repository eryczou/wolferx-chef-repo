#
# Cookbook Name:: wolf-yum
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
