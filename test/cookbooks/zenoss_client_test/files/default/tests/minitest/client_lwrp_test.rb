require_relative "../zenoss_client/test_helper"
require 'zenoss_client'

# Grab the detailed info for a device
# 
# @return [Hash]
def dev_info(connection, device_name)
  device = @devices.select {|n| n.name.include?(device_name) }.first
  data = connection.get_info(device.uid)['data']
  return data
end

describe_recipe "zenoss_client_test::client_lwrp" do
  include Zenoss::Client::Test::Helper

  before (:each) do
    @api_user = node['zenoss']['client']['test']['api_user']
    @api_password = node['zenoss']['client']['test']['api_password']
    @api_host = node['zenoss']['client']['server'] 
    @api_port = node['zenoss']['client']['server_port']
    
    @api_url = "http://#{@api_host}:#{@api_port}/zport/dmd"
    
    @connection = Zenoss.connect(@api_url, @api_user, @api_password)
    @devices = @connection.get_devices()
  end
  
  it "creates a device using minimal data" do
    @devices.select {|n| n.name.include?("TestDevice2") }.wont_be_empty
  end
  
  it "deletes a device" do
    @devices.select {|n| n.name.include?("TestDevice1") }.must_be_empty
  end
  
  it "creates a devices with a specified IP" do
    device = @devices.select {|n| n.name.include?("TestDevice3") }.first
    device.ipAddressString.must_equal "3.3.3.3"
  end
  
  it "sets the collector when requested" do
    device = @devices.select {|n| n.name.include?("TestDevice4") }.first
    device.collector.must_equal "boguscollector"
  end
  
  it "sets the device class when requested" do
    info = dev_info(@connection, "TestDevice5")
    info['deviceClass']['path'].must_equal "/Devices/Server/Linux"
  end
  
  it "sets a comment when requested" do
    info = dev_info(@connection, "TestDevice6")
    info['comments'].must_equal "LWRP test"
  end
  
end