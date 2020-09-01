# frozen_string_literal: true

module LogParsing
  module Services
    class LogAnalyzer
      attr_reader :log_entries

      def initialize(log_entries)
        @log_entries = log_entries
      end

      def call
        {
          overall: ordered_list(overall_statistics),
          uniq: ordered_list(uniq_statistics),
        }
      end

      private
      attr_reader :log_entries

      def ordered_list(histogram)
        histogram.sort_by { |page, count| [-count, page] }
      end

      def overall_statistics
        log_entries.map(&:page).tally
      end

      def uniq_statistics
        log_entries.uniq.map(&:page).tally
      end
    end
  end
end
