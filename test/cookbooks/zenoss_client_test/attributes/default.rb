default['zenoss']['client']['test']['api_user'] = "zenoss"
default['zenoss']['client']['test']['api_password'] = "zenoss"
  
# It takes a fairly signficant investment to get a remote Zenoss
# server in order to fully excercise the LWRP. Ideally we should
# test thos, but at the same time, lets not prevent them from
# from running some of the easier tests
default['zenoss']['client']['test']['run_lwrp_tests'] = false