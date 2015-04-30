# The repository to use for installing RServe
default['RServe']['cran_repo'] = "http://cran.rstudio.com/"
default['RServe']['rserve_package_location'] = "https://rforge.net/Rserve/snapshot/Rserve_1.8-2.tar.gz"
default['RServe']['startup_options'] = "--no-save"

default['RServe']['group_name'] = "rserver"
default['RServe']['user_name'] = "rserver"

default['RServe']['configuration'] = [
	"workdir  /tmp",
	"remote enable",
	"fileio enable",
	"auth required",
	"plaintext  enable",
	"pwdfile  /home/rserver/pwdfile"
]

default['RServe']['accounts'] = {
	"testuser" => "testpass",
	"testuser1" => "testpass1"
}

