# frozen_string_literal: true

module ChefRunRecorder
  # This module implements shared utility code for consistency with dependent cookbooks
  module Helper
    TCB = 'chef_run_recorder'

    def root_user
      return 'SYSTEM' if node['platform_family'] == 'windows'

      return 'root'
    end

    def root_group
      return 'wheel' if node['platform_family'] == 'freebsd'

      return 'SYSTEM' if node['platform_family'] == 'windows'

      return 'root'
    end

    def path_to_handler_directory
      has_handler = node['chef_handler'] && node['chef_handler']['handler_path']
      return node['chef_handler']['handler_path'] if has_handler

      return ::File.join(Chef::Config[:file_cache_path], 'handlers')
    end

    def path_to_handler
      return ::File.join(path_to_handler_directory, 'last_run_recorder.rb')
    end

    # Below must be the same as the handler logic
    def path_to_record_directory
      return '/opt/chef/run_record'
    end

    def path_to_last_run_time
      return ::File.join(path_to_record_directory, 'last_chef_run_time')
    end

    def path_to_last_run_node_name
      return ::File.join(path_to_record_directory, 'last_chef_run_node_name')
    end

    def path_to_last_run_success_flag
      return ::File.join(path_to_record_directory, 'last_chef_run_success_flag')
    end

    def path_to_last_run_exception
      return ::File.join(path_to_record_directory, 'last_chef_run_exception')
    end

    def path_to_last_run_node
      return ::File.join(path_to_record_directory, 'last_chef_run_node.json')
    end
  end
end

Chef::Provider.include(ChefRunRecorder::Helper)
Chef::Recipe.include(ChefRunRecorder::Helper)
Chef::Resource.include(ChefRunRecorder::Helper)
