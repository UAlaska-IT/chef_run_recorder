# frozen_string_literal: true

describe file('/opt/chef/run_record/last_chef_run_time') do
  it { should exist }
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) do
    should match(/\d+/)
  end
end

describe file('/opt/chef/run_record/last_chef_run_node_name') do
  it { should exist }
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/opt/chef/run_record/last_chef_run_success_flag') do
  it { should exist }
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its(:content) do
    should match(/[true|false]/)
  end
end

describe file('/opt/chef/run_record/last_chef_run_exception') do
  it { should exist }
  it { should be_file }
  it { should be_mode '644' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
