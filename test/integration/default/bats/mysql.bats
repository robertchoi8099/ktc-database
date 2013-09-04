# vim: ft=sh:

@test "mysql registered with etcd" {
  wget http://localhost:4001/v1/keys/services/mysql/members
}

@test "mysql is running" {
  /usr/bin/mysqladmin -u nova -pnova status
}
