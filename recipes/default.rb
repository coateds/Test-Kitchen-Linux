#
# Cookbook:: lcd_study
# Recipe:: default
#
# Copyright:: 2017, Dave, All Rights Reserved.

file '/tmp/default_action'

package 'httpd'
package 'net-tools'
package 'samba'

package 'vim-enhanced' do
  action :install
  provider Chef::Provider::Package::Yum
end

service 'httpd' do
  action [:enable, :start]
end

group 'developers'

user 'webadmin' do
  action :create
  uid '1020'
  gid 'developers'
  home '/home/webadmin'
  shell '/bin/bash'
end
