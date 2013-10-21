# vim: ft=sh:

@test "mysql registered with etcd" {
  curl http://127.0.0.1:4001/v1/keys/services/mysql/members
}

@test "compute db created" {
  /usr/bin/mysqladmin -u nova -pnova status
}

@test "dashboard db created" {
  /usr/bin/mysqladmin -u dash -phorizon status
}

@test "identity db created" {
  /usr/bin/mysqladmin -u keystone -pkeystone status
}

@test "image db created" {
  /usr/bin/mysqladmin -u glance -pglance status
}

@test "metering db created" {
  /usr/bin/mysqladmin -u ceilometer -pceilometer status
}

@test "network db created" {
  /usr/bin/mysqladmin -u quantum -pquantum status
}

@test "volume db created" {
  /usr/bin/mysqladmin -u cinder -pcinder status
}
