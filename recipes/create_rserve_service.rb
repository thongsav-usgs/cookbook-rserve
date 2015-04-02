#
# Cookbook Name:: RServe
# Recipe:: create_rserve_service
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Adds an RServe user, group and startup scripts

user_name = node['RServe']['user_name']
group_name = node['RServe']['group_name']

# Create the group and user
group group_name

user user_name do
	gid group_name
end

# Create the configuration file
template "/etc/RServ.conf" do
	source "RServ.conf.erb"
	owner user_name
	group group_name
	variables(
		:configs => node['RServe']['configuration']
	)
end

# Create the executable script
cookbook_file '/usr/lib64/R/bin/Rserv.sh' do
	source 'Rserv.sh'
	owner user_name
	group group_name
	mode '0550'
end

# Create the system service
template '/etc/init.d/rserved' do
	source 'rserved.erb'
	owner user_name
	group group_name
	mode '0550'
	variables(
		:user => user_name
	)
end
