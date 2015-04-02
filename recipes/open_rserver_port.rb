#
# Cookbook Name:: RServe
# Recipe:: open_rserver_port
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Open port in iptables

iptables_rule 'iptables_rserve_rule' do
  action :enable
end