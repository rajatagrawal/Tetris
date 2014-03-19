require 'spec_helper'
require 'tetris/shape/block'

module Tetris
  describe Block do
    describe '#initialize' do
      it 'assigns the gosu window object to an instance variable' do
        window = double('window')
        block = Block.new(window)
        expect(block.window).to eq window
      end

      it 'stores the length of block side' do
        window = double 'window'
        config = { side_length:  15 }
        block = Block.new(window, config)
        expect(block.side_length).to eq 15
      end

      it 'assigns a default value to side length' do
        window = double 'window'
        block = Block.new(window)
        expect(block.side_length).to eq 10
      end
    end

    describe '#height' do
      it 'returns the height of block' do
        window = double 'window'
        config = { side_length: 20 }
        block = Block.new(window, config)
        expect(block.height).to eq 20
      end
    end

    describe '#width' do
      it 'returns the width of block' do
        window = double 'window'
        config = { side_length: 20 }
        block = Block.new(window, config)
        expect(block.width).to eq 20
      end
    end

    describe '#draw' do
      it 'draws a rectangle' do
        window = double('window')
        config = { side_length: 15,
                   color: 'red' }
        block = Block.new(window, config)
        expect(window).to receive(:draw_quad).
          with(0,0,'red',
               15,0,'red',
               15,15,'red',
               0,15,'red')
        block.draw
      end
    end
  end
end
