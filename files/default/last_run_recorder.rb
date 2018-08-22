# frozen_string_literal: true

require 'chef/handler'

module ChefRunRecorder
  # A handler to cache run info for monitoring, MOTD, and ???
  class LastRunRecorder < Chef::Handler
    # It would be wonderful to use shared code, but these paths are redundant
    # MUST be the same as in cookbook helpers

    private

    TCB = 'chef_run_recorder'

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

    def log_record_location
      puts "Recording Chef run in directory '#{path_to_record_directory}'"
    end

    def write_run_time
      File.open(path_to_last_run_time, 'w') do |file|
        file.write Time.now.to_i
      end
    end

    def write_node_name
      File.open(path_to_last_run_node_name, 'w') do |file|
        file.write node.name
      end
    end

    def write_last_run_flag
      File.open(path_to_last_run_success_flag, 'w') do |file|
        if run_status.success?
          file.write 'true'
        else
          file.write 'false'
        end
      end
    end

    def write_exception
      File.open(path_to_last_run_exception, 'w') do |file|
        if run_status.success?
          file.write 'none'
        else
          file.write run_status.exception
        end
      end
    end

    def write_attributes
      # Wonky work around for attributes as of InSpec 2.1
      File.open(path_to_last_run_node, 'w') do |file|
        file.write node.to_json
      end
    end

    public

    def report
      log_record_location
      write_run_time
      write_node_name
      write_last_run_flag
      write_exception
      write_attributes
    end
  end
end
