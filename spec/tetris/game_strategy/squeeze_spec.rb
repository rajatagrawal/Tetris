require 'spec_helper'
require 'tetris/game_strategy/main'

module Tetris
  module GameStrategy
    describe Main do
      let(:window) { double 'window' }
      let(:config) { { width: 4, height: 3 } }
      let(:game_strategy) { described_class.new(window, config) }
      let(:tetris_map) { game_strategy.tetris_map }

      describe '#rows_to_squeeze' do
        it 'returns rows that can be squeezed' do
          (1..game_strategy.width).each do |n|
            tetris_map[n][3] = [false, 'blue']
            tetris_map[n][2] = [false, 'blue']
          end

          expect(game_strategy.rows_to_squeeze).to eq [2,3]
        end
      end

      describe '#squeeze_row' do
        it 'collapes the row to squeeze and moves row on top of it down by 1 row' do
          tetris_map[2][3] = [false, 'yellow']
          (1..game_strategy.width).each do |n|
            tetris_map[n][2] = [false, 'blue']
          end
          tetris_map[1][1] = [false, 'cyan']
          color = Gosu::Color::NONE
          expected_map = { 1 => { 1 => [true, color], 2 => [false, 'cyan'], 3 => [true, color]  },
                           2 => { 1 => [true, color], 2 => [true, color], 3 => [false, 'yellow'] },
                           3 => { 1 => [true, color], 2 => [true, color], 3 => [true, color] },
                           4 => { 1 => [true, color], 2 => [true, color], 3 => [true, color] } }
          game_strategy.squeeze_row(2)
          expect(tetris_map).to eq expected_map
        end
      end

      describe 'squeeze_rows' do
        it 'squeezes multiple rows' do
          expect(game_strategy).to receive(:squeeze_row).with(1)
          expect(game_strategy).to receive(:squeeze_row).with(2)
          expect(game_strategy).to receive(:squeeze_row).with(3)
          game_strategy.squeeze_rows([1,2,3])
        end
      end
    end
  end
end
