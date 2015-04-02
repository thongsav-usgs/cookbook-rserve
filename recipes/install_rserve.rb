#
# Cookbook Name:: RServe
# Recipe:: install_rserve
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: Installs the RServe package

repository = node['RServe']['cran_repo']
install_script = "/tmp/rserve_install.R"
template  install_script do
	owner "root"
	group "root"
	source "RServe_install.erb"
	variables(
		:repository => repository
	)
	not_if ('Rscript -e \'"Rserve" %in% rownames(installed.packages())\' | grep TRUE')
	notifies :run, "execute[install rserve]", :immediately
end

execute "install rserve" do
	command "Rscript --verbose --no-site-file --no-init-file --no-environ #{install_script}"
	action :nothing
end