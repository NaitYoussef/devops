include mysql::server

mysql::db { "store":
	schema 		=>	"store_schema",
	password	=>	"storesecret",
}	
