# frozen_string_literal: true

require './app/log_parsing/endpoints/analyze_log'

LogParsing::Endpoints::AnalyzeLog.new(ARGV.first).call
