# Zenoss Client Cookbook
The zenoss_client cookbook is intended to replace the functionality that used 
to reside in the client recipe of the [Zenoss cookbook](http://community.opscode.com/cookbooks/zenoss). 
In anticipation of  updates to that cookbook to support Core 4, the client 
logic is being split out to its own cookbook to help ease testing as well as 
reduce dependencies. The updates to the Zenoss cookbook to support core 4 will 
introduce a large number of dependencies, which most clients simply won't need.

Additionally by splitting out the client components, we are laying the
groundwork to later add some support for nodes to self-register using the 
JSON API.

## Requirements
This cookbook will need access to rubygems.org, or your node must be
pre-configured with a gem source that mirrors rubygems.org

## Usage
Include the default recipe in node's run_list and it will be configured.

If you are an environment where creating a local user for Zenoss to use
is not desirable, be sure to set the value of 
`node['zenoss']['client']['create_local_user']` to false. Doing so will
prevent a local user from being created

## Attributes
The attributes are documented in the default attributes file 
(`attributes/default.rb`). Please refer to that file for details about
the available attributes

## Recipes
Currently the only recipe that exists is the default recipe

## Authors
Author:: David Petzel (davidpetzel@gmail.com)

## Testing
This cookbook is setup to be tested using 
[test-kitchen](https://github.com/opscode/test-kitchen) and supporting tools.
You should ensure you have the following set of utilities on your machine:

* [Vagrant](http://www.vagrantup.com/)
* [Test Kitchen](https://github.com/opscode/test-kitchen)
* [Berkshelf](http://berkshelf.com/)
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
* [vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus)

You should refer to the Test Kitchen documentation for more in depth information
around running tests, however here is a quick rundown.

You can see the available test suites by running via the `kitchen list` command.
This will show you each combination that is available for testing. 

You can run all tests by running `kitchen test`. Or if you only want to test
Centos 6.4, you could run `kitchen test zenoss-client-centos-64`. You can also
use regular expression in place of the suite name to run a subset of all suites

Currently the platforms and suite(s) are configured to provide test coverage
of both Chef 10 and Chef 11


