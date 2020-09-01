# frozen_string_literal: true

module LogParsing
  module Errors
    class BaseError < StandardError
      def initialize(msg = nil)
        super(msg || default_message)
      end

      def default_message; end
    end
  end
end
