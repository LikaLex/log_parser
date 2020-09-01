# frozen_string_literal: true

require './app/log_parsing/errors/base_error'

module LogParsing
  module Errors
    class InvalidFormat < BaseError
      def default_message
        'Invalid file format'
      end
    end
  end
end
