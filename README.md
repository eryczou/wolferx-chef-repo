Overview
========

This is the "chef-repo" for building WolferX Development Environment.

How to use
==========

1. boot up a CentOS 7 linux machine (or EC2)
2. login with *root* user or running following command with sudo
3. update yum package management tool
	- *CMD:* yum update
4. install chef-client by rpm
	- *CMD:* rpm -ivh https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chef-12.5.1-1.el7.x86_64.rpm
5. create chef-client configure file
	- *CMD:* mkdir -p /etc/chef/
	- *CMD:* touch /etc/chef/client.rb
6. insert following config into /etc/chef/client.rb
	- *CMD:* vi /etc/chef/client.rb
	- *Config:*
	'''
	#environment 'production'
	#environment_path '/root/chef-repo/environments'
	#chef_server_url  "https://cfchef/organizations/wolferx"
	#validation_client_name "wolferx-validator"
	#Using default node name (fqdn)
	#trusted_certs_dir "/etc/chef/trusted_certs"
	log_location     STDOUT
	log_level :info
	cookbook_path   "/root/chef-repo/cookbooks"
	role_path '/root/chef-repo/roles'
	data_bag_path  '/root/chef-repo/data_bags'
	encrypted_data_bag_secret '/etc/chef'
	local_mode 'true'
	node_name 'node'
	node_path '/root/chef-repo/nodes'
	'''
7. create RSA key pair for github
8. install git & clone chef-repo
	- *CMD:* yum install git
	- *CMD:* git clone https://github.com/chenfanggm/wolfer-chef-repo.git
9. change the name of wolferx-chef-repo to chef-repo
	- *CMD:* mv ~/wolferx-chef-repo ~/chef-repo
10. bootstrap the server by chef-client
	- *CMD:* chef-client

Next Steps
==========

Read the README file in each of the subdirectories for more information about what goes in those directories.
