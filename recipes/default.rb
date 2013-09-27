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
include_recipe "simple_iptables::default"

iface = KTC::Network.if_lookup "management"
ip = KTC::Network.address "management"

Services::Connection.new run_context: run_context
member = Services::Member.new node.fqdn,
  service: "mysql",
  port: 3306,
  proto: "tcp",
  ip: ip
member.save

ep = Services::Endpoint.new "mysql"
ep.load

log "Loaded endpoint #{ep.inspect}"

if ep.ip.empty?
  log "Endpoint missing IP attribute, moving on"
  raise
end

# redirect VIP address to local realserver (DIRECT ROUTE)
simple_iptables_rule "mysql-direct-route" do
  table "nat"
  direction "PREROUTING"
  rule "-p tcp -d #{ep.ip} --dport 3306 -j REDIRECT"
  jump false
end

node.default["openstack"]["db"]["bind_interface"] = iface

include_recipe "openstack-common"
include_recipe "openstack-common::logging"

if node[:ha_disabled]
  include_recipe "openstack-ops-database::server"
else
  include_recipe "galera::server"
end

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
