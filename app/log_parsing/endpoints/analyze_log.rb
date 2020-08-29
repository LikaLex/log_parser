module LogParsing
  module Endpoints
    class AnalyzeLog
      attr_reader :file_name, :presenter

      def initialize(file_name, presenter)
        @file_name = file_name
        @presenter = presenter
      end

      def call
      end
    end
  end
end
