require 'spec_helper'
require 'tetris/shape/shape'

module Tetris
  describe Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'stores the window object for the shape' do
        shape = Shape.new(window)
        expect(shape.window).to eq window
      end
      it 'stores the coordinates of the shape' do
        config = { x: 5, y:6 }
        shape = Shape.new(window,config)
        expect(shape.x).to eq 5
        expect(shape.y).to eq 6
      end

      it 'assigns default coordinates to the shape' do
        shape = Shape.new window
        expect(shape.x).to eq 0
        expect(shape.y).to eq 0
      end

      it 'assigns color to the shape' do
        config = { color: 'red' }
        shape = Shape.new(window, config)
        expect(shape.color).to eq 'red'
      end

      it 'assigns default color to the shape' do
        shape = Shape.new window
        expect(shape.color).to eq Gosu::Color::RED
      end

      it 'assigns default values to height and width' do
        shape = Shape.new(window)
        expect(shape.height).to eq 0
        expect(shape.width).to eq 0
      end

      it 'stores speed for object to move with' do
        config = { speed: 6 }
        shape = Shape.new(window, config)
        expect(shape.speed).to eq 6
      end

      it 'assigns default speed to shape' do
        shape = Shape.new(window)
        expect(shape.speed).to eq 5
      end

      it 'stores unit side for shape' do
        config = { unit_side: 15 }
        shape = Shape.new(window, config)
        expect(shape.unit_side).to eq 15
      end

      it 'assigns default value to unit side' do
        shape = Shape.new window
        expect(shape.unit_side).to eq 10
      end
    end

    describe '#draw' do
      it 'is an abstract method to be implemented by subclasses' do
        shape = Shape.new(window)
        expect(shape.draw).to eq nil
      end
    end

    describe '#move' do
      it 'moves the shape in down direction' do
        shape = Shape.new(window)
        direction = 'down'
        expect{shape.move(direction)}.
          to change{shape.y}.by(shape.speed)
      end

      it 'moves the shape in up direction' do
        shape = Shape.new(window)
        direction = 'up'
        expect{shape.move(direction)}.
          to change{shape.y}.by(-1 * shape.speed)
      end

      it 'moves the shape right' do
        shape = Shape.new(window)
        direction = 'right'
        expect{shape.move(direction)}.
          to change{shape.x}.by(shape.speed)
      end

      it 'moves the shape left' do
        shape = Shape.new(window)
        direction = 'left'
        expect{shape.move(direction)}.
          to change{shape.x}.by(-1 * shape.speed)
      end
    end

    describe' block_coordinates' do
      it 'returns coordinates of constitutent blocks of shape' do
        shape = Shape.new window
        expect(shape.block_coordinates).to eq([])
      end
    end

    describe '#right_edge' do
      it 'gives x coordinates of the right edge' do
        config = { x: 15 }
        shape = Shape.new(window, config)
        expect(shape).to receive(:width).and_return(30)
        expect(shape.right_edge).to eq 45
      end
    end

    describe '#bottom_edge' do
      it 'gives y coordinates of bottom edge' do
        config = { y: 15 }
        shape = Shape.new(window, config)
        expect(shape).to receive(:height).and_return(30)
        expect(shape.bottom_edge).to eq 45
      end
    end
  end
end
