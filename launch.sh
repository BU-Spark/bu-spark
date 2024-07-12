#!/bin/bash

# Install missing gems
bundle check || bundle install

sed --follow-symlinks -i "s/<CODESPACE_NAME>/$CODESPACE_NAME/g" _config.yml
bundle exec jekyll build

cd _site

# Run Jekyll in auto-refresh mode (development mode) listening on all IPs
bundle exec jekyll serve --host 0.0.0.0 --livereload
