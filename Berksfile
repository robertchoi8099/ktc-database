#
# vim: set ft=ruby:
#
site :opscode

metadata

cookbook 'ktc-etcd', github: 'cloudware-cookbooks/ktc-etcd', branch: 'develop'
cookbook 'ktc-utils', github: 'cloudware-cookbooks/ktc-utils', branch: 'develop'
cookbook 'openstack-block-storage', github: 'stackforge/cookbook-openstack-block-storage'
cookbook "openstack-common", github: "stackforge/cookbook-openstack-common"
cookbook "openstack-compute", github: "stackforge/cookbook-openstack-compute"
cookbook "openstack-dashboard", github: "stackforge/cookbook-openstack-dashboard"
cookbook "openstack-identity", github: "stackforge/cookbook-openstack-identity"
cookbook "openstack-image", github: "stackforge/cookbook-openstack-image"
cookbook "openstack-metering", github: "stackforge/cookbook-openstack-metering"
cookbook "openstack-network", github: "stackforge/cookbook-openstack-network"
cookbook 'openstack-ops-database', github: 'stackforge/cookbook-openstack-ops-database'
cookbook 'services', github: 'spheromak/services-cookbook'

group :integration do
  cookbook 'curl'
  cookbook 'ubuntu'
end
