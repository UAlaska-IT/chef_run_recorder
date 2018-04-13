# frozen_string_literal: true

# Disable report handler in why-run mode
if Chef::Config[:why_run]
  Chef::Log.warn('skipping run recorder due to why-run mode')
  return
end

# add a chef-handler that creates a file with the current timestamp on a successful chef-run
directory path_to_handler_directory do
  owner 'root'
  group 'root'
  mode '0755'
end

# Write the handler code to the file system
cookbook_file path_to_handler do
  source 'last_run_recorder.rb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Enable report handler
chef_handler 'ChefRunRecorder::LastRunRecorder' do
  source path_to_handler
  supports report: true
  action :enable
end
