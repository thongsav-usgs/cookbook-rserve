# The repository to use for installing RServe
default['RServe']['cran_repo'] = "http://cran.rstudio.com/"

default['RServe']['group_name'] = "rserver"
default['RServe']['user_name'] = "rserver"

default['RServe']['configuration'] = [
	"workdir /tmp",
	"remote enable",
	"fileio enable",
	"auth required",
	"plaintext enable",
	"pwdfile /home/rserver/pwdfile"
]

default['RServe']['accounts'] = {
	"testuser" => "testpass"
}

