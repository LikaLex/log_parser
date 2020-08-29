require 'spec_helper'
require './app/log_parsing/endpoints/analyze_log'

describe LogParsing::Endpoints::AnalyzeLog do
  let (:presenter) { double(present_results: 'table', present_message: 'message') }

  it 'displays a message if file name is not passed' do
    expect(presenter).to receive(:present_message).with('File name is missing')
    described_class.new(nil, presenter).call
  end

  it 'displays a message if file content has wrong format' do
    pending('not implemented')
    expect(presenter).to receive(:present_message).with('Invalid file format')
    described_class.new('spec/fixtures/invalid_input.txt', presenter).call
  end

  it 'displays a message if empty file is passed' do
    pending('not implemented')
    expect(presenter).to receive(:present_message).with('Empty file is passed')
    described_class.new('spec/fixtures/empty_input.txt', presenter).call
  end

  it 'returns correct result' do
    pending('not implemented')
    expect(presenter).to receive(:present_results).with(
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
    described_class.new('spec/fixtures/valid_input.txt', presenter).call
  end
end
