#
# Cookbook Name:: RServe
# Recipe:: add_epel
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Adds the EPEL repository to a RHEL package manager

# add the EPEL repo
yum_repository 'epel' do
	description 'Extra Packages for Enterprise Linux'
	mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
	gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
	action :create
end

