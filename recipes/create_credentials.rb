#
# Cookbook Name:: RServe
# Recipe:: create_credentials
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Adds credentials to the rserve

user_name = node['RServe']['user_name']
group_name = node['RServe']['group_name']
accounts = node['RServe']['accounts']

# TODO- Check if an encrypted data bag item exists for the accounts hash
# and if it exists, use that instead 

template "/home/#{user_name}/pwdfile" do
	source "pwdfile.erb"
	owner user_name
	group group_name
	mode '0644'
	sensitive true
	variables(
		:accounts => accounts
	)
end


