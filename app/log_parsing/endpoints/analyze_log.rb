module LogParsing
  module Endpoints
    class AnalyzeLog
      attr_reader :file_name, :presenter

      def initialize(file_name, presenter)
        @file_name = file_name
        @presenter = presenter
      end

      def call
        raise 'File name is missing' unless file_name
        presenter.present_results({})
      rescue StandardError => e
        presenter.present_message(e.message)
      end
    end
  end
end
