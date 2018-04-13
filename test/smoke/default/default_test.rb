# frozen_string_literal: true

describe file('/opt/chef/run_record/last_chef_run_time') do
  it { should exist }
end

describe file('/opt/chef/run_record/last_chef_run_node_name') do
  it { should exist }
end

describe file('/opt/chef/run_record/last_chef_run_success_flag') do
  it { should exist }
end

describe file('/opt/chef/run_record/last_chef_run_exception') do
  it { should exist }
end
