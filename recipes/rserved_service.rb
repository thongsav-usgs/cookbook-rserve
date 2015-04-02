#
# Cookbook Name:: RServe
# Recipe:: rserved_service
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Installs and starts the rserved service

# Start at boot
service "rserved" do
	action [:enable, :start]
end