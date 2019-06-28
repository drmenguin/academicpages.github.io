#!/usr/bin/env bash
set -e # halt script on error

echo 'Testing travis...'
gem install ruby_dep -v '1.5.0'
bundle exec jekyll build
bundle exec htmlproofer ./_site --only-4xx
