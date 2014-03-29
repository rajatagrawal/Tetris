require 'spec_helper'
require 'tetris/game_strategy/window'

module Tetris
  module GameStrategy

    class TestWindow
      include Window
    end

    describe TestWindow do
      let(:window) { double 'window' }

      describe '#initialize' do
        it 'assigns a game window' do
          game_strategy = TestWindow.new window
          expect(game_strategy.window).to eq window
        end

        it 'stores the tetris map' do
          config = { width: 3, height: 2 }
          game_strategy = TestWindow.new(window, config)
          tetris_map = { 1=> [true, true, true],
                         2=> [true, true, true]}
          expect(game_strategy.tetris_map).to eq tetris_map
        end

        it 'stores the unit length for a block' do
          config = { unit_length: 15 }
          game_strategy = TestWindow.new(window, config)
          expect(game_strategy.unit_length).to eq 15
        end

        it 'assigns a default unit length' do
          game_strategy = TestWindow.new window
          expect(game_strategy.unit_length).to eq 10
        end

        it 'stores blocks width of the tetris window' do
          config = { width: 5 }
          game_strategy = TestWindow.new(window, config)
          expect(game_strategy.width).to eq 5
        end

        it 'assigns a default width to tetris window' do
          game_strategy = TestWindow.new(window)
          expect(game_strategy.width).to eq 10
        end

        it 'stores blocks height of the tetris window' do
          config = { height: 5 }
          game_strategy = TestWindow.new(window, config)
          expect(game_strategy.height).to eq 5
        end

        it 'assigns default block height to tetris window' do
          game_strategy = TestWindow.new(window)
          expect(game_strategy.height).to eq 10
        end
      end
    end
  end
end
