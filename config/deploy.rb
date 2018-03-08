# frozen_string_literal: true

lock '~> 3.10.0'

set :rvm_ruby_version, '2.4.1'

set :application, 'phuotluon'
set :repo_url, 'git@bitbucket.org:pikarubyphuotluon/phuotluon-server.git'

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :whenever_roles, -> { [:app] }
set :whenever_environment, fetch(:stage)

set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'
