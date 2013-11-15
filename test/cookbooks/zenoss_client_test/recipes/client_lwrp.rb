# This recipe will excercise the zenoss_client lwrp
#
# A few things of note:
#  - each device needs a unique ip, so the ip attribute makes a heavy appearance
# - to avoid race conditions with background add make heavy use of wait_for
include_recipe "#{cookbook_name}::default" 

if node['zenoss']['client']['test']['run_lwrp_tests'] == false
  return
end


# Lets test creating a new device, and "blocking" the run until its
# actually there
zenoss_client "TestDevice1" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
  ip  "1.1.1.1"
end

# Add a device using the "fire and forget" method
zenoss_client "TestDevice2" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
end


# Lets make sure we can delete a device. We need to be sure
# that we are using a previously created device that we waited for
zenoss_client "TestDevice1" do
  action :delete
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
end

# Test that we can override the ip
zenoss_client "TestDevice3" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
  ip "3.3.3.3"
end

# Test that we can override the collector
zenoss_client "TestDevice4" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
  ip "4.4.4.4"
  collector "boguscollector"
end

# Test we can set the device_class
zenoss_client "TestDevice5" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
  ip "5.5.5.5"
  device_class "/Devices/Server/Linux"
end

# Test that we can set device comments
zenoss_client "TestDevice6" do
  action :add
  api_user node['zenoss']['client']['test']['api_user']
  api_password node['zenoss']['client']['test']['api_password']
  wait_for 120
  ip "6.6.6.6"
  comments "LWRP test"
end


