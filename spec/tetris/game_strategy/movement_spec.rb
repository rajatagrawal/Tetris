require 'spec_helper'
require 'tetris/game_strategy/main'

module Tetris
  module GameStrategy
    describe Main do
      let(:window) { double 'window' }

      describe '#space_in_bottom?' do
        let(:config) { { width: 15, height: 15 } }
        let(:game_strategy) { described_class.new(window, config) }
        let(:square) { Square.new(window) }

        it 'returns true if there is an empty space at bottom of shape' do
          square.x = 2
          square.y = 13
          expect(game_strategy.space_in_bottom?(square)).to eq true
        end

        it 'returns false if shape is at end of the map' do
          square.x = 1
          square.y = 14
          expect(game_strategy.space_in_bottom?(square)).to eq false
        end

        it 'returns false if the space to move is already occupied' do
          square.x = 2
          square.y = 13
          game_strategy.tetris_map[2][15] = [false, 'color']
          expect(game_strategy.space_in_bottom?(square)).to eq false
        end
      end

      describe '#space_in_left?' do
        let(:config) { { width: 15, height: 15 } }
        let(:game_strategy) { described_class.new(window, config) }
        let(:square) { Square.new(window) }

        it 'returns true if there is an empty space to the left of shape' do
          square.x = 2
          square.y = 13
          expect(game_strategy.space_in_left?(square)).to eq true
        end

        it 'returns false if shape is at end of the map' do
          square.x = 1
          square.y = 13
          expect(game_strategy.space_in_left?(square)).to eq false
        end

        it 'returns false if the space to move is already occupied' do
          square.x = 2
          square.y = 13
          game_strategy.tetris_map[1][13] = [false, 'color']
          expect(game_strategy.space_in_left?(square)).to eq false
        end
      end

      describe '#space_in_right?' do
        let(:config) { { width: 15, height: 15 } }
        let(:game_strategy) { described_class.new(window, config) }
        let(:square) { Square.new(window) }

        it 'returns true if there is an empty space to the right of shape' do
          square.x = 13
          square.y = 13
          expect(game_strategy.space_in_right?(square)).to eq true
        end

        it 'returns false if shape is at end of the map' do
          square.x = 14
          square.y = 13
          expect(game_strategy.space_in_right?(square)).to eq false
        end

        it 'returns false if the space to move is already occupied' do
          square.x = 13
          square.y = 13
          game_strategy.tetris_map[15][13] = [false, 'color']
          expect(game_strategy.space_in_right?(square)).to eq false
        end
      end

      describe '#move_shape' do
        let(:game_strategy) { described_class.new window }

        xit 'moves a shape if there is space to move' do
          allow(game_strategy).to receive(:space_to_move?).and_return(true)
          game_strategy.generate_shape
          shape = game_strategy.shapes.last
          expect(shape).to receive(:move).with('down')
          game_strategy.move_shape('down')
        end

        xit 'only moves the last shape' do
          game_strategy.generate_shape
          shape = game_strategy.shapes.last
          game_strategy.generate_shape
          shape2 = game_strategy.shapes.last
          expect(shape).not_to receive(:move)
          expect(shape2).to receive(:move).with('down')
          game_strategy.move_shape('down')
        end

      end

      describe '#space_to_move?' do
        let(:config) { { height: 15, width: 15 } }
        let(:game_strategy) { described_class.new(window, config) }
        let(:shape) { Square.new(window) }
        it 'returns true if moving right and there is space in right' do
          allow(game_strategy).to receive(:space_in_right?).and_return(true)
          expect(game_strategy.space_to_move?('right', shape)).to eq true
        end

        it 'returns false if moving right and there is no space in right' do
          allow(game_strategy).to receive(:space_in_right?).and_return(false)
          expect(game_strategy.space_to_move?('right', shape)).to eq false
        end

        it 'returns true if moving left and there is space in left' do
          allow(game_strategy).to receive(:space_in_left?).and_return(true)
          expect(game_strategy.space_to_move?('left', shape)).to eq true
        end

        it 'returns false if moving right and there is no space in left' do
          allow(game_strategy).to receive(:space_in_left?).and_return(false)
          expect(game_strategy.space_to_move?('left', shape)).to eq false
        end

        it 'returns true if moving down and there is space in bottom' do
          allow(game_strategy).to receive(:space_in_bottom?).and_return(true)
          expect(game_strategy.space_to_move?('down', shape)).to eq true
        end

        it 'returns false if moving down and there is no space in bottom' do
          allow(game_strategy).to receive(:space_in_bottom?).and_return(false)
          expect(game_strategy.space_to_move?('down', shape)).to eq false
        end

        it 'returns false when trying to move up' do
          expect(game_strategy.space_to_move?('up', shape)).to eq false
        end
      end
    end
  end
end
