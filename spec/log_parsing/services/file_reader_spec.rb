require 'spec_helper'
require './app/log_parsing/services/file_reader'
require './app/lib/values/log_entry'

describe LogParsing::Services::FileReader do
  it 'raises exception if file name is missing' do
    expect { described_class.new(nil).call }.to raise_exception('File name is missing')
  end

  it 'raises exception if file name is blank' do
    expect { described_class.new('').call }.to raise_exception('File name is missing')
  end

  it 'raises exception if file does not exist' do
    expect { described_class.new('fixtures/nonexistent').call }.to raise_exception('File does not exists')
  end

  it 'raises exception if file has incorrect format' do
    expect { described_class.new('spec/fixtures/nonexistent').call }.to raise_exception('Invalid file format')
  end

  it 'raises exception if file is empty' do
    expect do
      described_class.new('spec/fixtures/empty_input.txt').call
    end.to raise_exception('File is empty')
  end

  it 'returns array of log entries' do
    expect(described_class.new('spec/fixtures/valid_input.txt').call).to(
      eq([
         ['/about/2', 2],
         ['/index', 2],
         ['/contact', 1],
         ['/help_page/1', 1],
         ['/home', 1]
      ].map { |tuple| LogEntry.new(*tuple) })
    )
  end
end
