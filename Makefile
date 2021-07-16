
SHELL := /bin/bash

lint:
	chef exec rubocop -A
	chef exec rubocop
	cookstyle .
