# frozen_string_literal: true

require './boot.rb'
require './app/log_parsing/interactors/parser'
require './app/log_parsing/presenters/terminal'

module LogParsing
  module Endpoints
    class AnalyzeLog
      attr_reader :file_name, :presenter

      def initialize(file_name, presenter = LogParsing::Presenters::Terminal.new)
        @file_name = file_name
        @presenter = presenter
      end

      def call
        statistics = LogParsing::Interactors::Parser.new(file_name).call
        presenter.present_statistics(statistics)
      rescue StandardError => e
        presenter.present_message(e.message)
      end
    end
  end
end
