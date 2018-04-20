# Chef Run Recorder Cookbook

__Maintainer: OIT Systems Engineering__ (<ua-oit-se@alaska.edu>)

## Purpose

Adds a chef-handler that creates files that record the state of the last run.
These files are intended to be easily discovered and used by external scripts, e.g. Message of the Day, and so have simple formats.
Most files contain a single string.

1. Node name
1. Current timestamp, a single integer representing seconds since epoch
1. Success flag, either 'true' or 'false'
1. Exception text, or 'none' for success

## Requirements

### Chef

This cookbook requires Chef 13+

### Platforms

Supported Platform Families:

* Linux
* BSD
* Windows

Platforms validated via Test Kitchen:

* Ubuntu
* Debian
* CentOS
* Fedora
* FreeBSD
* Windows

Notes:

* This cookbook should support any recent Windows or Linux variant.

## Resources

This cookbook provides no custom resources.

## Recipes

### chef_run_recorder::default

This recipe adds the handler that records the Chef run.  The handler runs at the end of the Chef run, so can be included early or late.

## Examples

This is an application cookbook; no custom resources are provided.  See recipes and attributes for details of what this cookbook does.

## Development

Development should follow [GitHub Flow](https://guides.github.com/introduction/flow/) to foster some shared responsibility.

* Fork/branch the repository
* Make changes
* Fix all Rubocop (`rubocop`) and Foodcritic (`foodcritic .`) offenses
* Write smoke tests that reasonably cover the changes (`kitchen verify`)
* Pass all smoke tests
* Submit a Pull Request using Github
* Wait for feedback and merge from a second developer

### Requirements

For running tests in Test Kitchen a few dependencies must be installed.

* [ChefDK](https://downloads.chef.io/chef-dk/)
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Install the dependency tree with `berks install`
* Install the Vagrant WinRM plugin:  `vagrant plugin install vagrant-winrm`
