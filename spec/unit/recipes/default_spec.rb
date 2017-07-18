#
# Cookbook:: lcd_study
# Spec:: default
#
# Copyright:: 2017, Dave, All Rights Reserved.

require 'spec_helper'

describe 'lcd_study::default' do
  context 'CentOS' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates a file with the default action' do
      expect(chef_run).to create_file('/tmp/default_action')
    end

    it 'installs httpd' do
      expect(chef_run).to install_package('httpd')
    end

    it 'installs net-tools' do
      expect(chef_run).to install_package('net-tools')
    end

    it 'installs samba' do
      expect(chef_run).to install_package('samba')
    end

    it 'enables the httpd service' do
      expect(chef_run).to enable_service('httpd')
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service('httpd')
    end

    it 'creates the group' do
      expect(chef_run).to create_group('developers')
    end

    it 'creates the user' do
      expect(chef_run).to create_user('webadmin').with(group: 'developers')
    end

  end
end
