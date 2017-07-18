# # encoding: utf-8

# Inspec test for recipe lcd_study::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

describe file('/tmp/default_action') do
  it { should exist }
end

['net-tools', 'httpd'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe package('samba') do
  it { should be_installed }
end

describe package('vim-enhanced') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe user('webadmin') do
    it { should exist }
    its('group') { should eq 'developers' }
end

describe group('developers') do
    it { should exist }
end
