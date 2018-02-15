include mysql::client
include tomcat::server


file { "/var/lib/tomcat7/conf/.keystore":
	owner	=>	root,
	group	=>	tomcat7,
	mode	=>	0640,
	source	=>	"/vagrant/manifests/.keystore",
	require	=>	Package["tomcat7"],
	notify	=>	Service["tomcat7"],
}

file { "/var/lib/tomcat7/conf/server.xml":
	owner	=>	root,
	group	=>	tomcat7,
	mode	=>	0644,
	source	=>	"puppet:///modules/tomcat/server.xml",
	require	=>	Package["tomcat7"],
	notify	=>	Service["tomcat7"],
}


$db_user		=	"store"
$db_password	=	"storesecret"
$db_host		=	"192.168.33.10"
$db_schema		=	"store_schema"

file { "/var/lib/tomcat7/conf/context.xml":
	owner	=>	root,
	group	=>	tomcat7,
	mode	=>	0644,
	content	=>	template("tomcat/context.xml"),
	require	=> 	Package["tomcat7"],
	notify	=>	Service["tomcat7"],
}

file { "/var/lib/tomcat7/webapps/devopsnapratica.war":
	owner	=> 	tomcat7,
	group	=>	tomcat7,
	mode	=>	0644,
	source	=> 	"/vagrant/manifests/devopsnapratica.war",
	require	=>	Package["tomcat7"],
	notify	=>	Service["tomcat7"],
}