# frozen_string_literal: true

module ChefRunRecorder
  # This module implements shared utility code for consistency with dependent cookbooks
  module Helper
    def path_to_last_run_time
      return ::File.join(Chef::Config[:file_cache_path], 'last_chef_run_time.rb')
    end

    def path_to_last_run_node_name
      return ::File.join(Chef::Config[:file_cache_path], 'last_chef_run_node_name.rb')
    end

    def path_to_last_run_success_flag
      return ::File.join(Chef::Config[:file_cache_path], 'last_chef_run_success_flag.rb')
    end

    def path_to_last_run_exception
      return ::File.join(Chef::Config[:file_cache_path], 'last_chef_run_exception.rb')
    end
  end
end

Chef::Recipe.include(ChefRunRecorder::Helper)
Chef::Resource.include(ChefRunRecorder::Helper)
