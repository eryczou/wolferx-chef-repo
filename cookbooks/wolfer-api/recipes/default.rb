#
# Cookbook Name:: wolfer-api
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git '/site/wolfx' do
  repository 'https://github.com/wolferian/wolferapi.git'
  revision 'master'
  action :sync
end

execute 'mvn clean install wolfx' do
  command 'mvn -f /site/wolfx/pom.xml clean install'
  notifies :run, 'execute[rm previous wolfx.war]', :immediately
end

execute 'rm previous wolfx.war' do
  command 'rm -f /var/lib/tomcat/webapps/wolfx.war'
  only_if { ::File.exists? '[/var/lib/tomcat/webapps/wolfx.war]' } 
  action :nothing
  notifies :run, 'execute[cp war wolfx to tomcat home]', :immediately
end

execute 'cp war wolfx to tomcat home' do
  command 'cp /site/wolfx/target/wolfx.war /var/lib/tomcat/webapps/'
end

service "tomcat" do
  action :restart
end