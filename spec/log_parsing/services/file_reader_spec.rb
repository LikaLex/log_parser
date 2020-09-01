# frozen_string_literal: true

require 'spec_helper'
require './app/log_parsing/services/file_reader'
require './app/log_parsing/errors/missing_argument_error'
require './app/log_parsing/errors/invalid_format_error'
require './app/log_parsing/errors/empty_file_error'
require './lib/values/log_entry'

describe LogParsing::Services::FileReader do
  it 'raises exception if file name is missing' do
    expect { described_class.new(nil).call }.to(
      raise_exception(LogParsing::Errors::MissingArgumentError, 'File name is missing')
    )
  end

  it 'raises exception if file name is blank' do
    expect { described_class.new('').call }.to(
      raise_exception(LogParsing::Errors::MissingArgumentError, 'File name is missing')
    )
  end

  it 'raises exception if file does not exist' do
    expect do
      described_class.new('./spec/fixtures/nonexistent').call
    end.to raise_exception(Errno::ENOENT)
  end

  it 'raises exception if file has incorrect format' do
    expect do
      described_class.new('./spec/fixtures/invalid_input_structure.txt').call
    end.to raise_exception(LogParsing::Errors::InvalidFormat, 'Invalid file format')
  end

  it 'raises exception if file is empty' do
    expect do
      described_class.new('./spec/fixtures/empty_input.txt').call
    end.to raise_exception(LogParsing::Errors::EmptyFileError, 'File is empty')
  end

  it 'returns array of log entries' do
    expect(described_class.new('./spec/fixtures/valid_input.txt').call).to(
      eq([
        %w[/help_page/1 126.318.035.038],
        %w[/contact 184.123.665.067],
        %w[/home 184.123.665.067],
        %w[/about/2 444.701.448.104],
        %w[/about/2 444.701.448.104],
        %w[/index 316.433.849.805],
        %w[/index 802.683.925.780]
      ].map { |tuple| Values::LogEntry.new(*tuple) })
    )
  end
end
