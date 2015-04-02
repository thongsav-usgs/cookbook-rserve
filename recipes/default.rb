#
# Cookbook Name:: RServe
# Recipe:: default
#

if %w{rhel fedora centos}.include?(node["platform"])
	include_recipe 'RServe::add_epel'
end

include_recipe 'RServe::install_r'

include_recipe 'RServe::install_rserve'

include_recipe 'RServe::create_rserve_service'

include_recipe 'RServe::create_credentials'

include_recipe 'RServe::rserved_service'

include_recipe 'RServe::open_rserver_port'