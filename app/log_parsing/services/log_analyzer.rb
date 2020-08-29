# frozen_string_literal: true

module LogParsing
  module Services
    class LogAnalyzer
      attr_reader :log_entries

      def initialize(log_entries)
        @log_entries = log_entries
      end

      def call
      end
    end
  end
end
