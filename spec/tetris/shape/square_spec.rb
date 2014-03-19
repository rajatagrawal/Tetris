require 'spec_helper'
require 'tetris/shape/square'

module Tetris
  describe Square do
    describe '#initialize' do
      it 'sets length of block side' do
        window = double 'window'
        config = { block_side: 15 }
        square = Square.new(window, config)
        expect(square.block_side).to eq 15
      end

      it 'assigns default value to block side' do
        window = double' window'
        square = Square.new(window)
        expect(square.block_side).to eq 10
      end

      it 'creates and configures top left block' do
        window = double 'window'
        config = { x: 10, y: 10, block_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.top_left_block.x).to eq 10
        expect(square.top_left_block.y).to eq 10
        expect(square.top_left_block.color).to eq 'red'
        expect(square.top_left_block.height).to eq 15
      end

      it 'creates and configures top right block' do
        window = double 'window'
        config = { x: 10, y: 10, block_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.top_right_block.x).to eq 25
        expect(square.top_right_block.y).to eq 10
        expect(square.top_right_block.side_length).to eq 15
        expect(square.top_right_block.color).to eq 'red'
      end

      it 'creates and configures bottom left block' do
        window = double 'window'
        config = { x: 10, y: 10, block_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.bottom_left_block.x).to eq 10
        expect(square.bottom_left_block.y).to eq 25
        expect(square.bottom_left_block.side_length).to eq 15
        expect(square.bottom_left_block.color).to eq 'red'
      end

      it 'creates and configures bottom right block' do
        window = double 'window'
        config = { x: 10, y: 10, block_side: 15, color: 'red' }
        square = Square.new(window, config)
        expect(square.bottom_right_block.x).to eq 25
        expect(square.bottom_right_block.y).to eq 25
        expect(square.bottom_right_block.side_length).to eq 15
        expect(square.bottom_right_block.color).to eq 'red'
      end
    end

    describe '#height' do
      it 'returns height of square' do
        window = double 'window'
        config = { block_side: 15 }
        square = Square.new(window, config)
        expect(square.height).to eq 30
      end
    end

    describe '#width' do
      it 'returns width of square' do
        window = double 'window'
        config = { block_side: 15 }
        square = Square.new(window, config)
        expect(square.width).to eq 30
      end
    end

    describe '#draw' do
      it 'draws blocks of the square' do
        window = double 'window'
        square = Square.new(window)
        expect(square.top_left_block).to receive(:draw)
        expect(square.top_right_block).to receive(:draw)
        expect(square.bottom_left_block).to receive(:draw)
        expect(square.bottom_right_block).to receive(:draw)
        square.draw
      end
    end
  end
end
