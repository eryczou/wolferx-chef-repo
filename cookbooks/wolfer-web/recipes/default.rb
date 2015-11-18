#
# Cookbook Name:: wolfer-web
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'npm install -g gulp' do
  command 'npm install -g gulp'
end

execute 'npm install -g bower' do
  command 'npm install -g bower'
end

execute 'npm install -g browserify' do
  command 'npm install -g browserify'
end

execute 'npm install -g nodemon' do
  command 'npm install -g nodemon'
end

execute 'npm install -g forever' do
  command 'npm install -g forever'
end

git '/site/wolferweb' do
  repository 'https://github.com/wolferian/wolferweb.git'
  revision 'master'
  action :sync
end

execute 'npm install wolerweb' do
  command 'cd /site/wolferweb'
end

execute 'npm install wolerweb' do
  command 'npm install /site/wolferweb'
end

execute 'gulp build wolerweb' do
  command 'gulp build'
end

execute 'forever stop all' do
  command 'forever stopall'
end

execute 'forever wolferweb' do
  command 'npm run forever'
end
