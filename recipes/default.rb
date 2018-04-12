# frozen_string_literal: true

# Disable report handler in why-run mode
if Chef::Config[:why_run]
  Chef::Log.warn('skipping run recorder due to why-run mode')
  return
end

# Write the handler code to the file system
cookbook_file ::File.join(node['chef_handler']['handler_path'], 'last_run_recorder.rb') do
  source 'last_run_recorder.rb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Enable report handler
chef_handler 'ChefRunRecorder::LastRunRecorder' do
  source ::File.join(node['chef_handler']['handler_path'], 'last_run_recorder.rb')
  supports report: true
  action :enable
end
