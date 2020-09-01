# frozen_string_literal: true

require './app/log_parsing/errors/base_error'

module LogParsing
  module Errors
    class MissingArgumentError < BaseError
      def default_message
        'File name is missing'
      end
    end
  end
end
