require 'spec_helper'
require 'tetris/block'

module Tetris
  describe Block do

    describe '#initialize' do
      it 'assigns the gosu window object to an instance variable' do
        window = double('window')
        block = Block.new(window)
        expect(block.window).to eq window
      end

      it 'stores the coordinates 'do
        window = double('window')
        x = 1;
        y = 2;
        block = Block.new(window, x, y)
        expect(block.x).to eq 1;
        expect(block.y).to eq 2;
      end

      it 'assigns default arguments to the position of the block' do
        window = double 'window'
        block = Block.new(window)
        expect(block.x).to eq 0
        expect(block.y).to eq 0
      end

      it 'stores the height and width of the block' do
        window = double('window')
        width = 15
        height = 10
        block = Block.new(window, 1,1 , width, height)
        expect(block.width).to eq 15
        expect(block.height).to eq 10
      end

      it 'assigns default value to the width and height of the block' do
        window = double 'window'
        block = Block.new window
        expect(block.width).to eq 10
        expect(block.height).to eq 10
      end

      it 'stores the color for the block' do
        window = double 'window'
        block = Block.new(window,0,0,0,0, 'red')
        expect(block.color).to eq 'red'
      end

      it 'stores default color for the block' do
        window = double 'window'
        block = Block.new(window)
        expect(block.color).to eq Gosu::Color::RED
      end
    end

    describe '#draw' do
      it 'draws a rectangle' do
        window = double('window')
        red = Gosu::Color::RED
        block = Block.new(window,0,0,10,10,red)
        expect(window).to receive(:draw_quad).
          with(0,0,red, 10,0,red, 10,10,red, 0,10,red)
        block.draw
      end
    end
  end
end
