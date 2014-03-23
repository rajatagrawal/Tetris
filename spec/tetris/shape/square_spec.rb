require 'spec_helper'
require 'tetris/shape/square'

module Tetris
  describe Square do
    let(:window) { double 'window' }

    describe '#initialize' do

      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.top_left_block.x).to eq 10
        expect(square.top_left_block.y).to eq 10
        expect(square.top_left_block.color).to eq 'red'
        expect(square.top_left_block.height).to eq 15
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.top_right_block.x).to eq 25
        expect(square.top_right_block.y).to eq 10
        expect(square.top_right_block.unit_side).to eq 15
        expect(square.top_right_block.color).to eq 'red'
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.bottom_left_block.x).to eq 10
        expect(square.bottom_left_block.y).to eq 25
        expect(square.bottom_left_block.unit_side).to eq 15
        expect(square.bottom_left_block.color).to eq 'red'
      end

      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.bottom_right_block.x).to eq 25
        expect(square.bottom_right_block.y).to eq 25
        expect(square.bottom_right_block.unit_side).to eq 15
        expect(square.bottom_right_block.color).to eq 'red'
      end
    end

    describe '#height' do
      it 'returns height of square' do
        config = { unit_side: 15 }
        square = Square.new(window, config)
        expect(square.height).to eq 30
      end
    end

    describe '#width' do
      it 'returns width of square' do
        config = { unit_side: 15 }
        square = Square.new(window, config)
        expect(square.width).to eq 30
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15}
        square = Square.new(window, config)
        block_coordinates = [[20,20],[35,20],[35,35],[20,35]]
        expect(square.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the square' do
        square = Square.new(window)
        expect(square.top_left_block).to receive(:draw)
        expect(square.top_right_block).to receive(:draw)
        expect(square.bottom_left_block).to receive(:draw)
        expect(square.bottom_right_block).to receive(:draw)
        square.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        config = { speed: 6 }
        square = Square.new(window, config)
        expect{square.move('down')}.
          to change{square.y}.by(square.speed)
        expect{square.move('down')}.
          to change{square.top_left_block.y}.by(square.speed)
        expect{square.move('down')}.
          to change{square.top_right_block.y}.by(square.speed)
        expect{square.move('down')}.
          to change{square.bottom_left_block.y}.by(square.speed)
        expect{square.move('down')}.
          to change{square.bottom_right_block.y}.by(square.speed)
      end

      it 'moves itself up' do
        square = Square.new(window)
        expect{square.move('up')}.
          to change{square.y}.by(-1 * square.speed)
        expect{square.move('up')}.
          to change{square.top_left_block.y}.by(-1 * square.speed)
        expect{square.move('up')}.
          to change{square.top_right_block.y}.by(-1 * square.speed)
        expect{square.move('up')}.
          to change{square.bottom_left_block.y}.by(-1 * square.speed)
        expect{square.move('up')}.
          to change{square.bottom_right_block.y}.by(-1 * square.speed)
      end

      it 'moves itself right' do
        square = Square.new(window)
        expect{square.move('right')}.
          to change{square.x}.by(square.speed)
        expect{square.move('right')}.
          to change{square.top_left_block.x}.by(square.speed)
        expect{square.move('right')}.
          to change{square.top_right_block.x}.by(square.speed)
        expect{square.move('right')}.
          to change{square.bottom_left_block.x}.by(square.speed)
        expect{square.move('right')}.
          to change{square.bottom_right_block.x}.by(square.speed)
      end

      it 'moves itself left' do
        square = Square.new(window)
        expect{square.move('left')}.
          to change{square.x}.by(-1 * square.speed)
        expect{square.move('left')}.
          to change{square.top_left_block.x}.by(-1 * square.speed)
        expect{square.move('left')}.
          to change{square.top_right_block.x}.by(-1 * square.speed)
        expect{square.move('left')}.
          to change{square.bottom_left_block.x}.by(-1 * square.speed)
        expect{square.move('left')}.
          to change{square.bottom_right_block.x}.by(-1 * square.speed)
      end
    end
  end
end
