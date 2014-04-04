require 'spec_helper'
require 'tetris/game_strategy/main'

module Tetris
  module GameStrategy
    describe Main do
      let(:window) { double 'window' }

      describe '#shape_x' do
        it 'generates random x coordinate for a
          shape between 1 and (width - shape_width + 1 )' do
          game_strategy = described_class.new window
          shape_width = Square.new(window).width
          max_value = game_strategy.width - shape_width + 1
          x = game_strategy.shape_x(Square)
          expect(x).to be_between(1, max_value)
        end
      end

      describe '#generate_shape' do
        let(:game_strategy) { described_class.new window }

        it 'generates a random shape' do
          expect(game_strategy.shapes.size).to eq 0
          expect(described_class::Shapes).to receive(:sample)
            .and_return(Square)
          game_strategy.generate_shape
          expect(game_strategy.shapes.size).to eq 1
          shape_class = game_strategy.shapes.last.class
          expect(shape_class).to eq Square
        end

        it 'generates a shape with random x coordinate' do
          expect(game_strategy).to receive(:shape_x)
          game_strategy.generate_shape
        end

        it 'assigns the unit side to the generated shape' do
          config = { unit_side: 50 }
          game_strategy = described_class.new(window, config)
          game_strategy.generate_shape
          shape = game_strategy.shapes.last
          expect(shape.unit_side).to eq 50
        end

        it 'assigns a random color to each shape' do
          expect(described_class::ShapeColors).to receive(:sample)
            .and_return('blue')
          shape1 = game_strategy.generate_shape.last
          expect(shape1.color).to eq Gosu::Color::BLUE
        end

        it 'exits the program if there is no space to generate shape' do
          expect(game_strategy).to receive(:space_empty?).and_return false
          expect(Kernel).to receive(:exit)
          game_strategy.generate_shape
        end
      end

      describe '#space_empty?' do
        let(:strategy_config) { { height: 2, width: 2 } }
        let(:game_strategy) { described_class.new(window, strategy_config) }
        let(:shape_config) { { x: 1, y: 1 } }
        let(:shape) { Square.new(window, shape_config) }
        it 'returns true if there is space to generate a shape' do
          expect(game_strategy.space_empty?(shape)).to eq true
        end

        it 'returns false if there is no space to generate a shape' do
          game_strategy.tetris_map[1][1] = [false, 'color']
          expect(game_strategy.space_empty?(shape)).to eq false
        end
      end

      describe 'freeze_shape' do
        it 'stores the coordinates of the shape in tetris map' do
          config = { height: 5, width: 5 }
          game_strategy = described_class.new(window, config)
          square = Square.new window
          block_coordinates = [[1, 2, 'blue'],
                               [2, 2, 'blue'],
                               [1, 3, 'blue'],
                               [2, 3, 'blue']]
          allow(square).to receive(:block_coordinates).
            and_return(block_coordinates)
          game_strategy.freeze_shape square
          expect(game_strategy.tetris_map[1][2]).to eq [false, 'blue']
          expect(game_strategy.tetris_map[2][2]).to eq [false, 'blue']
          expect(game_strategy.tetris_map[1][3]).to eq [false, 'blue']
          expect(game_strategy.tetris_map[2][3]).to eq [false, 'blue']
        end
      end

      describe '#run_game' do
        let(:game_strategy) { described_class.new window }
        it 'initializes the game by generating a shape' do
          expect(game_strategy.shapes.size).to eq 0
          game_strategy.run_game
          expect(game_strategy.shapes.size).to eq 1
        end

        context 'when moving down and there is no space to move' do
          it 'freezes the shape' do
            allow(game_strategy).to receive(:space_to_move?).
              with('down',anything()).and_return(false)
            expect(game_strategy).to receive(:freeze_shape)
            game_strategy.run_game
          end

          it 'generates a new shape' do
            allow(game_strategy).to receive(:space_to_move?).
              with('down',anything()).and_return(false)
            allow(game_strategy).to receive(:freeze_shape)
            expect(game_strategy).to receive(:generate_shape).
              at_least(:once)
            game_strategy.run_game
          end
        end
      end
    end
  end
end
