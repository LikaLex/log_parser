require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require './app/log_parsing/endpoints/analyze_log'

LogParsing::Endpoints::AnalyzeLog.new(ARGV.first).call
