# frozen_string_literal: true

require 'spec_helper'
require './app/log_parsing/services/log_analyzer'
require './lib/values/log_entry'

describe LogParsing::Services::LogAnalyzer do
  it 'builds result in expected format' do
    expect(described_class.new([
       %w[/help_page/1 126.318.035.038],
       %w[/contact 184.123.665.067],
       %w[/home 184.123.665.067],
       %w[/about/2 444.701.448.104],
       %w[/about/2 444.701.448.104],
       %w[/index 316.433.849.805],
       %w[/index 802.683.925.780]
     ].map { |tuple| Values::LogEntry.new(*tuple) }
    ).call).to(
      eq(
        overall: [
          ['/about/2', 2],
          ['/index', 2],
          ['/contact', 1],
          ['/help_page/1', 1],
          ['/home', 1]
        ],
        uniq: [
          ['/index', 2],
          ['/about/2', 1],
          ['/contact', 1],
          ['/help_page/1', 1],
          ['/home', 1]
        ]
      )
    )
  end
end
