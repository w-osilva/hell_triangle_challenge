# encoding: utf-8
require 'bundler/setup'
Bundler.require

ActiveSupport::Dependencies.autoload_paths += %w[
  app/concerns
  app/models
]



