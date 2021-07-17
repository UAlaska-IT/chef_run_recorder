
SHELL := /bin/bash

lint:
	chef exec rubocop -A
	chef exec rubocop
	cookstyle .

tag:
	chef exec ruby -r "./tag.rb" -e "tag"

tag-push:
	git push --tags

share:
	# For category see https://docs.chef.io/knife_cookbook_site.html
	knife supermarket share chef_run_recorder Utilities
