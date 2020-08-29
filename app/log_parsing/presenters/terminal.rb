module LogParsing
  module Presenters
    class Terminal
      def present_statistics(statistics)
        puts('Number of visitors:')
        puts(::Terminal::Table.new(rows: statistics[:overall]))
        puts('Number of unique visitors:')
        puts(::Terminal::Table.new(rows: statistics[:uniq]))
      end

      def present_message(message)
        puts(message)
      end
    end
  end
end
