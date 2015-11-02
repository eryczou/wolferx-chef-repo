#
# Cookbook Name:: wolfer-end
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


service 'cassandra' do
  action [:enable, :restart]
  notifies :run, 'execute[deploy test schema]', :immediately
end

execute 'deploy test schema' do
  command 'cqlsh -f ~/chef-repo/cassandra_schema/testTable.cql'
  action :nothing
end