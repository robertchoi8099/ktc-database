# database to be used
node.default["openstack"]["db"]["service_type"] = "mysql"

# process monitoring
default["openstack"]["db"]["service_processes"] = [
  { "name" =>  "mysqld", "shortname" =>  "mysqld" }
]
