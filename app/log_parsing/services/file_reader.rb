# frozen_string_literal: true

require './lib/values/log_entry'

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
        raise 'File name is missing' unless file_name
        raise 'File name is missing' if file_name.empty?
        raise 'File is empty' if File.size(file_name).zero?
      end

      def parse_file
        IO.foreach(file_name).map do |line|
          parts = line.split(' ')
          raise 'Invalid file format' unless parts.size == 2

          Values::LogEntry.new(*parts)
        end
      end

      private

      attr_reader :file_name
    end
  end
end
