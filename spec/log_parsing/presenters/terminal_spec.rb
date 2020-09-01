# frozen_string_literal: true

require 'spec_helper'
require './app/log_parsing/presenters/terminal'

describe LogParsing::Presenters::Terminal do
  describe '#present_message' do
    it 'prints message to console' do
      message = 'some message'
      expect { described_class.new.present_message(message) }.to output(a_string_including(message)).to_stdout
    end
  end

  describe '#present_statistics' do
    let(:input) do
      {
        overall: [
          ['/index', 2],
          ['/contact', 1],
          ['/home', 1]
        ],
        uniq: [
          ['/index', 2],
          ['/about/2', 1],
          ['/help_page/1', 1]
        ]
      }
    end

    it 'prints overall statistics table to console' do
      expect { described_class.new.present_statistics(input) }.to(
        output(
          a_string_including(
            Terminal::Table.new(
              rows: [
                ['/index', 2],
                ['/contact', 1],
                ['/home', 1]
              ]
            ).to_s
          )
        ).to_stdout
      )
    end

    it 'prints uniq statistics table to console' do
      expect { described_class.new.present_statistics(input) }.to(
        output(
          a_string_including(
            Terminal::Table.new(
              rows: [
                ['/index', 2],
                ['/about/2', 1],
                ['/help_page/1', 1]
              ]
            ).to_s
          )
        ).to_stdout
      )
    end
  end
end
