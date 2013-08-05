name             'ktc-database'
maintainer       'KT Cloudware'
maintainer_email 'wil.reichert@kt.com'
license          'All rights reserved'
description      'Application / role cookbook for stackforge os-ops-database cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ centos ubuntu }.each do |os|
  supports os
end

%w{
  ktc-utils
  openstack-common
  openstack-ops-database
}.each do |dep|
  depends dep
end
