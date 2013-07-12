name             'zenoss_client_test'
maintainer       "David Petzel"
maintainer_email "davidpetzel@gmail.com"
license           "Apache 2.0"
description      'Cookbook internal to the zenoss_client cookbook used for testing'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends   "zenoss_client"
depends   "minitest-handler"
