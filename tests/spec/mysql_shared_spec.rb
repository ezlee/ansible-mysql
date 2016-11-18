require 'spec_helper'

shared_examples 'mysql::base' do
  describe package('mysql') do
    it { should be_installed }
  end

  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end

  describe process('mysql') do
    it { should be_running }
    its(:user) { should eq 'mysql' }
  end

  describe user('mysql') do
    it { should exist }
    it { should belong_to_group 'mysql' }
  end

  describe group('mysql') do
    it { should exist }
  end

end
