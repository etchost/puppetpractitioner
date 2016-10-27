require 'spec_helper'
describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# update the conf file in the module or update this
# test with the proper name before this will pass
describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
  it { should contain "ServerName localhost" }
end
