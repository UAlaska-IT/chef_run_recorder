# Chef Run Recorder Cookbook

[![License](https://img.shields.io/github/license/ualaska-it/chef_run_recorder.svg)](https://github.com/ualaska-it/chef_run_recorder)
[![GitHub Tag](https://img.shields.io/github/tag/ualaska-it/chef_run_recorder.svg)](https://github.com/ualaska-it/chef_run_recorder)

__Maintainer: OIT Systems Engineering__ (<ua-oit-se@alaska.edu>)

## Purpose

Adds a chef-handler that creates files that record the result of the last run.
These files are intended to be easily discovered and used by external scripts, e.g. Message of the Day, and so have simple formats.
Most files contain a single string.

1. `/opt/chef/run_record/last_chef_run_node_name`: Node name
1. `/opt/chef/run_record/last_chef_run_time`: Current timestamp, a single integer representing seconds since epoch
1. `/opt/chef/run_record/last_chef_run_success_flag`: Success flag, either 'true' or 'false'
1. `/opt/chef/run_record/last_chef_run_exception`: Exception text, or 'none' for success
1. `/opt/chef/run_record/last_chef_run_node.json`: The Json representation of the node object

## Requirements

### Chef

This cookbook requires Chef 14+

### Platforms

Supported Platform Families:

* Debian
  * Ubuntu, Mint
* Red Hat Enterprise Linux
  * Amazon, CentOS, Oracle
* Suse
* BSD
* Windows

Platforms validated via Test Kitchen:

* Ubuntu
* Debian
* CentOS
* Oracle
* Fedora
* Amazon
* Suse
* Windows

Notes:

* This cookbook should support any recent Windows or Linux variant.

### Dependencies

This cookbook does not constrain its dependencies because it is intended as a utility library.
It should ultimately be used within a wrapper cookbook.

## Resources

This cookbook provides no custom resources.

## Recipes

### chef_run_recorder::default

This recipe adds the handler that records the Chef run.
The handler runs at the end of the Chef run, so can be included early or late.

## Examples

This is an application cookbook; no custom resources are provided.
See recipes and attributes for details of what this cookbook does.

## Development

See CONTRIBUTING.md and TESTING.md.
