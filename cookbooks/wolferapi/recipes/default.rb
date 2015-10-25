#
# Cookbook Name:: wolferapi
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git '/site/wolfx' do
  repository 'git@github.com:chenfanggm/wolfx.git'
  revision 'master'
  action :sync
end

execute 'mvn clean install wolfx' do
  command 'mvn -f /site/wolfx/pom.xml clean install'
  notifies :run, 'execute[cp war wolfx to tomcat home]', :immediately
end

execute 'cp war wolfx to tomcat home' do
  command 'cp /site/wolfx/target/wolfx.war /var/lib/tomcat/webapps/'
end

service "tomcat" do
  action :restart
end