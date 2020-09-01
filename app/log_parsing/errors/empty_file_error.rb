# frozen_string_literal: true

require './app/log_parsing/errors/base_error'

module LogParsing
  module Errors
    class EmptyFileError < BaseError
      def default_message
        'File is empty'
      end
    end
  end
end
