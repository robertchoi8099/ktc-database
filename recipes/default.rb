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

d = { "ip"=>get_interface("management"), "port"=>"3306"}
register_service("mysql-db", d)

node.default["openstack"]["db"]["bind_interface"] = get_interface("management")

include_recipe "openstack-common"
include_recipe "openstack-common::logging"
include_recipe "openstack-ops-database::server"

