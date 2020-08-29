# frozen_string_literal: true
require './app/log_parsing/services/file_reader'
require './app/log_parsing/services/log_analyzer'

module LogParsing
  module Interactors
    class Parser
      attr_reader :file_name

      def initialize(file_name)
        @file_name = file_name
      end

      def call
        entries = LogParsing::Services::FileReader.new(file_name).call
        LogParsing::Services::LogAnalyzer.new(entries).call
      end
    end
  end
end
