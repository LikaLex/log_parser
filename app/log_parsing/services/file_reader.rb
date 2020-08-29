module LogParsing
  module Services
    class FileReader
      attr_reader :file_name

      def initialize(file_name)
        @file_name = file_name
      end

      def call
      end
    end
  end
end
