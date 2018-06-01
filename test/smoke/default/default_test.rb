# frozen_string_literal: true

root_user = if os[:family] == 'windows'
              'SYSTEM'
            else
              'root'
            end

root_group = if os[:name ] == 'freebsd'
               'wheel'
             elsif os[:family] == 'windows'
               'SYSTEM'
             else
               'root'
             end

describe file('/opt/chef/run_record/last_chef_run_time') do
  it { should exist }
  it { should be_file }
  its(:content) do
    should match(/\d+/)
  end
end

describe file('/opt/chef/run_record/last_chef_run_node_name') do
  it { should exist }
  it { should be_file }
end

describe file('/opt/chef/run_record/last_chef_run_success_flag') do
  it { should exist }
  it { should be_file }
  its(:content) do
    should match(/[true|false]/)
  end
end

describe file('/opt/chef/run_record/last_chef_run_exception') do
  it { should exist }
  it { should be_file }
end

if os[:family] != 'windows'
  describe file('/opt/chef/run_record/last_chef_run_time'), unless: os[:family] == 'windows' do
    it { should be_mode 0o644 }
    it { should be_owned_by root_user }
    it { should be_grouped_into root_group }
  end

  describe file('/opt/chef/run_record/last_chef_run_node_name'), unless: os[:family] == 'windows' do
    it { should be_mode 0o644 }
    it { should be_owned_by root_user }
    it { should be_grouped_into root_group }
  end

  describe file('/opt/chef/run_record/last_chef_run_success_flag'), unless: os[:family] == 'windows' do
    it { should be_mode 0o644 }
    it { should be_owned_by root_user }
    it { should be_grouped_into root_group }
  end

  describe file('/opt/chef/run_record/last_chef_run_exception'), unless: os[:family] == 'windows' do
    it { should be_mode 0o644 }
    it { should be_owned_by root_user }
    it { should be_grouped_into root_group }
  end
end
