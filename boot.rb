# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
Bundler.require(ENV['GROUP']) if ENV['GROUP']
