# frozen_string_literal: true

require './lib/values/log_entry'
require './app/log_parsing/errors/empty_file_error'
require './app/log_parsing/errors/missing_argument_error'
require './app/log_parsing/errors/invalid_format_error'

module LogParsing
  module Services
    class FileReader
      def initialize(file_name)
        @file_name = file_name
      end

      def call
        validate_file
        parse_file
      end

      private

      def validate_file
        raise Errors::MissingArgumentError unless file_name
        raise Errors::MissingArgumentError if file_name.empty?
        raise Errors::EmptyFileError if File.size(file_name).zero?
      end

      def parse_file
        IO.foreach(file_name).map do |line|
          parts = line.split(' ')
          raise Errors::InvalidFormat unless parts.size == 2

          Values::LogEntry.new(*parts)
        end
      end

      private

      attr_reader :file_name
    end
  end
end
