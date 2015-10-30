#
# Cookbook Name:: wolfer-cassandra
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/apache-cassandra.tar.gz" do
   source "http://apache.arvixe.com/cassandra/3.0.0/apache-cassandra-3.0.0-rc2-bin.tar.gz"
   notifies :run, 'execute[untar cassandra]', :immediately
end

execute 'untar cassandra' do
  command 'tar -xzvf /tmp/apache-cassandra.tar.gz -C /tmp'
  action :nothing
  notifies :run, 'execute[move cassandra to opt dir]', :immediately  
end

execute 'move cassandra to opt dir' do
  command 'mv /tmp/apache-cassandra-3.0.0-rc2 /opt/apache-cassandra'
  action :nothing
end

