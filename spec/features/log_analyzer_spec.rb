# frozen_string_literal: true

require 'pty'

describe 'log_analyzer.rb' do
  it 'prints ordered lists of page visits' do
    PTY.spawn('ruby log_analyzer.rb spec/fixtures/valid_input.txt') do |output, _input|
      expect(output.read.gsub("\r", '')).to(
        eql(
          <<~OUTPUT
            Number of visitors:
            +--------------+---+
            | /about/2     | 2 |
            | /index       | 2 |
            | /contact     | 1 |
            | /help_page/1 | 1 |
            | /home        | 1 |
            +--------------+---+
            Number of unique visitors:
            +--------------+---+
            | /index       | 2 |
            | /about/2     | 1 |
            | /contact     | 1 |
            | /help_page/1 | 1 |
            | /home        | 1 |
            +--------------+---+
          OUTPUT
        )
      )
    end
  end

  it 'displays a message if file name is not passed' do
    PTY.spawn('ruby log_analyzer.rb ') do |output, _input|
      expect(output.read.gsub("\r", '')).to eq("File name is missing\n")
    end
  end

  it 'displays a message if file content has wrong format' do
    PTY.spawn('ruby log_analyzer.rb spec/fixtures/invalid_input.txt') do |output, _input|
      expect(output.read.gsub("\r", '')).to eq("Invalid file format\n")
    end
  end

  it 'displays a message if empty file is passed' do
    PTY.spawn('ruby log_analyzer.rb spec/fixtures/empty_input.txt') do |output, _input|
      expect(output.read.gsub("\r", '')).to eq("File is empty\n")
    end
  end
end
