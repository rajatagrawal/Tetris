require 'spec_helper'
require 'tetris/shape/block'

module Tetris
  describe Block do
    let(:window) { double 'window' }
    describe '#height' do
      it 'returns the height of block' do
        block = Block.new window
        expect(block.height).to eq 1
      end
    end

    describe '#width' do
      it 'returns the width of block' do
        block = Block.new window
        expect(block.width).to eq 1
      end
    end

    describe '#draw' do
      it 'draws a rectangle' do
        config = { x: 5,
                   y: 5,
                   unit_side: 15,
                   color: 'red' }
        block = Block.new(window, config)
        expect(window).to receive(:draw_quad).
          with(75,75,Gosu::Color::RED,
               90,75,Gosu::Color::RED,
               90,90,Gosu::Color::RED,
               75,90,Gosu::Color::RED)
          block.draw
      end
    end

    describe '#block_coordinates' do
      it 'returns block coordinates of block' do
        config = { x: 20, y: 20 }
        block = Block.new(window, config)
        expect(block.block_coordinates).to eq([[20,20]])
      end
    end
  end
end
