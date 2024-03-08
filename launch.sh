#!/bin/bash

bundler install
bundle exec jekyll build
bundler exec jekyll serve -H 0.0.0.0
