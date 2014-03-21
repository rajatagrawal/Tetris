require 'spec_helper'
require 'tetris/game_strategy'

module Tetris
  describe GameStrategy do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'assigns a game window' do
        game_strategy = GameStrategy.new window
        expect(game_strategy.window).to eq window
      end

      it 'stores the unit length for a block' do
        config = { unit_length: 15 }
        game_strategy = GameStrategy.new(window, config)
        expect(game_strategy.unit_length).to eq 15
      end

      it 'assigns a default unit length' do
        game_strategy = GameStrategy.new window
        expect(game_strategy.unit_length).to eq 10
      end

      it 'stores the width of the tetris window' do
        config = { width: 30 }
        game_strategy = GameStrategy.new(window, config)
        expect(game_strategy.width).to eq 30
      end

      it 'assigns a default width to tetris window' do
        game_strategy = GameStrategy.new(window)
        expect(game_strategy.width).to eq (20*game_strategy.unit_length)
      end

      it 'assigns width in exact multiples of unit length' do
        config = { unit_length: 15, width: 100 }
        game_strategy = GameStrategy.new(window, config)
        expect(game_strategy.width).to eq 90
      end

      it 'stores height of the tetris window' do
        config = { height: 30 }
        game_strategy = GameStrategy.new(window, config)
        expect(game_strategy.height).to eq 30
      end

      it 'assigns a default height to tetris window' do
        game_strategy = GameStrategy.new(window)
        expect(game_strategy.height).to eq (40*game_strategy.unit_length)
      end

      it 'assigns height in exact multiples of unit length' do
        config = { unit_length: 15, height: 100 }
        game_strategy = GameStrategy.new(window,config)
        expect(game_strategy.height).to eq 90
      end
    end

    describe '#generate_shape' do
      let(:game_strategy) { GameStrategy.new window }

      it 'generates a random shape' do
        expect(game_strategy.shapes.size).to eq 0
        game_strategy.generate_shape
        expect(game_strategy.shapes.size).to eq 1
        expect([Square, Block]).to include game_strategy.shapes[0].class
      end

      it 'generates a shape only if the previous shape has
          finished traversing the tetris window' do
        expect(game_strategy.shapes.size).to eq 0
        game_strategy.generate_shape
        expect(game_strategy.shapes.size).to eq 1
        game_strategy.generate_shape
        expect(game_strategy.shapes.size).to eq 1
        game_strategy.shapes[-1].y = game_strategy.height
        game_strategy.generate_shape
        expect(game_strategy.shapes.size).to eq 2
      end
    end

    describe '#move_shape' do
      let(:game_strategy) { GameStrategy.new window }
      let(:shape) do
        game_strategy.generate_shape;
        game_strategy.shapes[0]
      end

      it 'moves a shape in the game' do
        expect(shape).to receive(:move).with('down')
        game_strategy.move_shape('down')
      end

      it 'only moves the last shape' do
        shape.y = game_strategy.height
        game_strategy.generate_shape
        shape2 = game_strategy.shapes[-1]
        expect(shape).not_to receive(:move)
        expect(shape2).to receive(:move).with('down')
        game_strategy.move_shape('down')
      end

      describe 'moves shape only if it is within game window boundaries' do
        context 'when moving left and shape is at boundary edge' do
          it 'does not move the shape' do
            shape.x = 0
            expect(shape).not_to receive(:move)
            game_strategy.move_shape('left')
          end
        end

        context 'when moving left and shape is not at boundary edge' do
          it 'does not move the shape' do
            shape.x = 10
            expect(shape).to receive(:move).with('left')
            game_strategy.move_shape('left')
          end
        end

        context 'when moving right and shape is at boundary edge' do
          it 'does not move the shape' do
            shape.x = game_strategy.width
            expect(shape).not_to receive(:move)
            game_strategy.move_shape('right')
          end
        end

        context 'when moving right and shape is not at boundary edge' do
          it 'does not move the shape' do
            expect(shape).to receive(:right_edge).and_return(20)
            expect(shape).to receive(:move).with('right')
            game_strategy.move_shape('right')
          end
        end

        context 'when moving down and there is space to move' do
          it 'moves the shape' do
            expect(game_strategy).to receive(:space_to_move?).
              and_return(true)
            expect(shape).to receive(:move).with('down')
            game_strategy.move_shape('down')
          end
        end

        context 'when moving down and there is no space to move' do
          it 'does not move the shape' do
            expect(game_strategy).to receive(:space_to_move?).
              and_return(false)
            expect(shape).not_to receive(:move).with('down')
            game_strategy.move_shape('down')
          end
        end

        it 'does not move the shape up' do
          expect(shape).not_to receive(:move).with('up')
          game_strategy.move_shape('up')
        end
      end
    end
  end
end
