#!/usr/bin/env rake

require "bundler/gem_tasks"
require File.expand_path('../lib/javascript-load-image-rails/source_file', __FILE__)

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'javascript-load-image-rails/version'

task default: :update

desc "Update library"
task :update do
  files = SourceFile.new
  files.fetch
end

task gem: :build
task :build do
  system "gem build javascript-load-image-rails.gemspec"
end

task release: :build do
  version = Introjs::Rails::VERSION
  system "git tag -a v#{version} -m 'Tagging #{version}'"
  system "git push --tags"
  system "gem push javascript-load-image-#{version}.gem"
  system "rm javascript-load-image-#{version}.gem"
end
