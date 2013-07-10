require 'chefspec'

describe 'zenoss_client::default' do

  it "creates the local zenoss user when requested" do
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set['zenoss']['client']['create_local_user'] =  true
    chef_run.converge described_recipe
    
  end
  
  it "does not create the local zenoss user when told not to" do
    chef_run = ChefSpec::ChefRunner.new()
    chef_run.node.set['zenoss']['client']['create_local_user'] =  false
    chef_run.converge described_recipe
  end
end
