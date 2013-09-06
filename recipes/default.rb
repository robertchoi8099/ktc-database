#
# Cookbook Name:: ktc-database
# Recipe:: default
#
# Copyright 2013, KT Cloudware
#
# All rights reserved - Do Not Redistribute
#

class Chef::Recipe
  include KTCUtils
end

ip = get_interface_address("management")
d = get_openstack_service_template(ip, "3306")
register_member("mysql", d)

node.default["openstack"]["db"]["bind_interface"] = get_interface("management")

include_recipe "openstack-common"
include_recipe "openstack-common::logging"
include_recipe "openstack-ops-database::server"

%w/
  compute
  dashboard
  identity
  image
  metering
  network
  volume
/.each do |s|
  node.default["openstack"]["db"][s]["host"] = ip
end

include_recipe "openstack-ops-database::openstack-db"
