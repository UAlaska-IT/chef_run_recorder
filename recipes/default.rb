# frozen_string_literal: true

cookbook_file ::File.join(node['chef_handler']['handler_path'], 'last_run_recorder.rb') do
  source 'last_run_recorder.rb'
  owner 'root'
  group 'root'
  mode '0644'
end

chef_handler 'ChefRunRecorder::LastRunRecorder' do
  source ::File.join(node['chef_handler']['handler_path'], 'last_run_recorder.rb')
  action :enable
end
