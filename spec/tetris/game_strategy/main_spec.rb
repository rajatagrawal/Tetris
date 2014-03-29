require 'spec_helper'
require 'tetris/game_strategy/main'

module Tetris
  module GameStrategy
    describe Main do
      it 'stores the gosu window object' do
        window = double 'window'
        game_strategy = described_class.new window
        expect(game_strategy.window).to eq window
      end
    end
  end
end
