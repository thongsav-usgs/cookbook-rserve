#
# Cookbook Name:: RServe
# Recipe:: install_rserve
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Installs the RServe package

remote_install_file = node['RServe']['rserve_package_location']
install_script = "/tmp/rserve_install.R"

if remote_install_file.empty?
  repository = node['RServe']['cran_repo']
  template install_script do
  	owner "root"
  	group "root"
  	source "RServe_install.erb"
  	variables(
  		:repository => repository
  	)
  	not_if ('Rscript -e \'"Rserve" %in% rownames(installed.packages())\' | grep TRUE')
  	notifies :run, "execute[install rserve]", :immediately
  end
else 
  # Chef::Config[:file_cache_path]
  remote_file "#{Chef::Config[:file_cache_path]}/r.tar.gz" do
    source remote_install_file
  end
  
  template install_script do
  	owner "root"
  	group "root"
  	source "RServe_install_from_file.erb"
  	variables(
  		:binary_location => "#{Chef::Config[:file_cache_path]}/r.tar.gz"
  	)
  	not_if ('Rscript -e \'"Rserve" %in% rownames(installed.packages())\' | grep TRUE')
  	notifies :run, "execute[install rserve]", :immediately
  end
end

execute "install rserve" do
	command "Rscript --verbose --no-site-file --no-init-file --no-environ #{install_script}"
	action :nothing
end

