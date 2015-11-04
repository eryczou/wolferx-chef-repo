Overview
========

This is the "chef-repo" for building WolferX Development Environment.
It will automate bootstrap a complete server for your development environment.
It majorly includes:
	- Nginx
	- Angular2
	- Nodejs
	- Tomcat
	- Jersey
	- Cassandra

How to use
==========

1. boot up CentOS-7 linux machine using Virtual Box (or EC2)
2. login with *root* user or running following command with sudo
	- *Suggest:* to add a password for root, somehow the system will add a password for you if you don't
	- *CMD:* passwd root
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
	#environment 'production' <br/>
	#environment_path '/root/chef-repo/environments' <br/>
	#chef_server_url  "https://cfchef/organizations/wolferx" <br/>
	#validation_client_name "wolferx-validator" <br/>
	#Using default node name (fqdn) <br/>
	#trusted_certs_dir "/etc/chef/trusted_certs" <br/>
	log_location  STDOUT <br/>
	log_level :info <br/>
	cookbook_path  "/root/chef-repo/cookbooks" <br/>
	role_path '/root/chef-repo/roles' <br/>
	data_bag_path  '/root/chef-repo/data_bags' <br/>
	encrypted_data_bag_secret '/etc/chef' <br/>
	local_mode 'true' <br/>
	node_name 'node' <br/>
	node_path '/root/chef-repo/nodes' <br/>
7. create RSA key pair for github
	(Following is optional, only no id_rsa && id_rsa.pub file exist in ~/.ssh)
	- *CMD:* mkdir ~/.ssh
	- *CMD:* cd ~/.ssh
	- *CMD:* ls -al
	- *CMD:* ssh-keygen -t rsa -b 4096 -C "wolferiangm@gmail.com"
	- keep enter empty when CL ask you for path & passphrase
	- add id_rsa.pub to github (ask Chen for github access)
8. install git & clone chef-repo
	- *CMD:* yum install git
	- *CMD:* git clone https://github.com/wolferian/wolferx-chef-repo
9. change the name of wolferx-chef-repo to chef-repo
	- *CMD:* mv ~/wolferx-chef-repo ~/chef-repo
10. bootstrap the server by chef-client
	- *CMD:* chef-client
	- 1st time may fail at tomcat trying to add SSL, if so, just run chef-client again
11. deploy cassandra schema for testing
	- *CMD:* cqlsh -f ~/chef-repo/cassandra_schema/testTable.cql

Test
====

1. @Linux get ip address of the server
	- *CMD:* ifconfig
2. @Local add Linux hostname to hosts
	- *CMD:* vi /etc/hosts
	- insert "hostname ip", eg. "x.x.x.x wolferx.com"
3. @Browser 
	- *url:* http://wolferx.com:8080/wolferapi/rest/test
4. @Cassandra
	- *GUI Tool:* https://academy.datastax.com/downloads/ops-center?destination=downloads/ops-center&dxt=DX#devCenter 
	- connet to ip_address of VM, port 9042

Congrats!
=========

You should have a running machine with one line deployment enabled.
- *One Line*: chef-client
- *Deploy*: https://github.com/wolferian/wolferapi
