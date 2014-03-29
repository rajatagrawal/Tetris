require 'spec_helper'
require 'tetris/game_strategy/game_control'

module Tetris
  module GameStrategy
    class TestGameControl
      include Window
      include Movement
      include GameControl
    end

    describe TestGameControl do
      let(:window) { double 'window' }

      describe '#random_coordinates' do
        it 'generates a pair of random x coordinate' do
          game_strategy = TestGameControl.new window
          width = game_strategy.width
          expect(game_strategy.random_x_coordinate).to be_between(1, width)
        end
      end

      describe '#generate_shape' do
        let(:game_strategy) { TestGameControl.new window }

        it 'generates a random shape' do
          expect(game_strategy.shapes.size).to eq 0
          game_strategy.generate_shape
          expect(game_strategy.shapes.size).to eq 1
          expect([Square, Block]).to include game_strategy.shapes[0].class
        end

        it 'generates a shape with random x coordinate' do
          expect(game_strategy).to receive(:random_x_coordinate)
          game_strategy.generate_shape
        end

        it 'assigns the unit side to the generated shape' do
          config = { unit_side: 50 }
          game_strategy = TestGameControl.new(window, config)
          game_strategy.generate_shape
          shape = game_strategy.shapes.last
          expect(shape.unit_side).to eq 50
        end
      end

      describe 'freeze_shape' do
        it 'stores the coordinates of the shape in tetris map' do
          config = { height: 5, width: 5 }
          game_strategy = TestGameControl.new(window, config)
          square = Square.new window
          block_coordinates = [[1,2],[2,2],[1,3],[2,3]]
          allow(square).to receive(:block_coordinates).
            and_return(block_coordinates)
          game_strategy.freeze_shape square
          expect(game_strategy.tetris_map[1][2]).to eq false
          expect(game_strategy.tetris_map[2][2]).to eq false
          expect(game_strategy.tetris_map[1][3]).to eq false
          expect(game_strategy.tetris_map[2][3]).to eq false
        end
      end

      describe '#run_game' do
        let(:game_strategy) { TestGameControl.new window }
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
