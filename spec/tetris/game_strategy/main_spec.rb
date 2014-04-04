require 'spec_helper'
require 'tetris/game_strategy/main'

module Tetris
  module GameStrategy
    describe Main do
      let(:window) { double 'window' }

      describe '#initialize' do
        it 'assigns a game window' do
          game_strategy = described_class.new window
          expect(game_strategy.window).to eq window
        end

        it 'stores the unit length for a block' do
          config = { unit_side: 15 }
          game_strategy = described_class.new(window, config)
          expect(game_strategy.unit_side).to eq 15
        end

        it 'assigns a default unit length' do
          game_strategy = described_class.new window
          expect(game_strategy.unit_side).to eq 10
        end

        it 'stores blocks width of the tetris window' do
          config = { width: 5 }
          game_strategy = described_class.new(window, config)
          expect(game_strategy.width).to eq 5
        end

        it 'assigns a default width to tetris window' do
          game_strategy = described_class.new window
          expect(game_strategy.width).to eq 10
        end

        it 'stores blocks height of the tetris window' do
          config = { height: 5 }
          game_strategy = described_class.new(window, config)
          expect(game_strategy.height).to eq 5
        end

        it 'assigns default block height to tetris window' do
          game_strategy = described_class.new(window)
          expect(game_strategy.height).to eq 10
        end

        it 'initializes the shape array' do
          game_strategy = described_class.new window
          expect(game_strategy.shapes).to eq []
        end

        it 'stores the speed of shape movements' do
          config = { speed: 7 }
          game_strategy = described_class.new(window, config)
          expect(game_strategy.speed).to eq 7
        end

        it 'assigns default speed for shape movements' do
          game_strategy = described_class.new window
          expect(game_strategy.speed).to eq 1
        end

        it 'stores the tetris map' do
          config = { width: 3, height: 2 }
          game_strategy = described_class.new(window, config)
          tetris_map = { 1=> {1 => [true, Gosu::Color::NONE],
                              2 => [true, Gosu::Color::NONE]},
                         2=> {1 => [true, Gosu::Color::NONE],
                              2 => [true, Gosu::Color::NONE]},
                         3=> {1 => [true, Gosu::Color::NONE],
                              2 => [true, Gosu::Color::NONE]}}
          expect(game_strategy.tetris_map).to eq tetris_map
        end

      end
    end
  end
end
