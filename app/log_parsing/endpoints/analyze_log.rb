# frozen_string_literal: true

require './boot.rb'
require './app/log_parsing/interactors/log_analyzer'
require './app/log_parsing/presenters/terminal'

module LogParsing
  module Endpoints
    class AnalyzeLog
      def initialize(file_name, presenter = LogParsing::Presenters::Terminal.new)
        @file_name = file_name
        @presenter = presenter
      end

      def call
        statistics = LogParsing::Interactors::LogAnalyzer.new(file_name).call
        presenter.present_statistics(statistics)
      rescue StandardError => e
        presenter.present_message(e.message)
      end

      private

      attr_reader :file_name, :presenter
    end
  end
end
