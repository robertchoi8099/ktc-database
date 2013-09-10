#
# Cookbook Name:: ktc-database
# Recipe:: default
#
# Copyright 2013, KT Cloudware
#
# All rights reserved - Do Not Redistribute
#

include_recipe "services"
include_recipe "ktc-utils"

iface = KTC::Network.if_lookup "management"
ip = KTC::Network.address "management"

Services::Connection.new run_context: run_context
member = Services::Member.new node.fqdn,
  service: "mysql",
  port: 3306,
  proto: "tcp",
  ip: ip

member.save

node.default["openstack"]["db"]["bind_interface"] = iface

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
