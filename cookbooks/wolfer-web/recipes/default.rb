#
# Cookbook Name:: wolfer-web
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "mongodb::default"

mongodb_instance "chef_mongo" do
  port node['mongodb']['port']
end

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

bash 'export npm bin to PATH' do
  cwd '/root' 
  code <<-EOH
    if [[ :$PATH: == *:/usr/local/nodejs-binary-5.1.0/bin:* ]]; then
      echo '# O.K., the directory /usr/local/nodejs-binary-5.1.0/bin is on the path'
    else
      echo 'export PATH=$PATH:/usr/local/nodejs-binary-5.1.0/bin'  >> ~/.bash_profile
      export PATH=$PATH:/usr/local/nodejs-binary-5.1.0/bin
    fi
    EOH
end

git '/site/wolferweb' do
  repository 'https://github.com/wolferian/wolferweb.git'
  revision 'master'
  action :sync
end

execute 'npm install wolerweb' do
  cwd '/site/wolferweb'
  command 'npm install'
end

execute 'bower install wolerweb' do
  cwd '/site/wolferweb'
  command 'bower install --allow-root --config.interactive=false'
end

execute 'gulp build wolerweb' do
  cwd '/site/wolferweb'
  command 'gulp build'
end

execute 'forever stop all' do
  cwd '/site/wolferweb'
  command 'forever stopall'
end

execute 'forever wolferweb' do
  cwd '/site/wolferweb'
  command 'npm run forever'
end
