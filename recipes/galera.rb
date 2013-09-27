# shamelessly ripped from https://github.com/stackforge/cookbook-openstack-ops-database/blob/master/recipes/mysql-server.rb

class ::Chef::Recipe
  include ::Openstack
end

listen_address = address_for node["openstack"]["db"]["bind_interface"]

node.override["mysql"]["bind_address"] = listen_address
node.override["mysql"]["tunable"]["innodb_thread_concurrency"] = "0"
node.override["mysql"]["tunable"]["innodb_commit_concurrency"] = "0"
node.override["mysql"]["tunable"]["innodb_read_io_threads"] = "4"
node.override["mysql"]["tunable"]["innodb_flush_log_at_trx_commit"] = "2"

include_recipe "openstack-ops-database::mysql-client"
include_recipe "galera::server"

mysql_connection_info = {
  :host => "localhost",
  :username => "root",
  :password => node["mysql"]["server_root_password"]
}

mysql_database "FLUSH PRIVILEGES" do
  connection mysql_connection_info
  sql "FLUSH PRIVILEGES"
  action :query
end

# Unfortunately, this is needed to get around a MySQL bug
# that repeatedly shows its face when running this in Vagabond
# containers:
#
# http://bugs.mysql.com/bug.php?id=69644
mysql_database "drop empty localhost user" do
  sql "DELETE FROM mysql.user WHERE User = '' OR Password = ''"
  connection mysql_connection_info
  action :query
end

mysql_database "test" do
  connection mysql_connection_info
  action :drop
end

mysql_database "FLUSH PRIVILEGES" do
  connection mysql_connection_info
  sql "FLUSH PRIVILEGES"
  action :query
end
