require 'spec_helper'
require 'tetris/shape/block'

module Tetris
  describe Block do
    let(:window) { double 'window' }
    describe '#height' do
      it 'returns the height of block' do
        config = { unit_side: 20 }
        block = Block.new(window, config)
        expect(block.height).to eq 20
      end
    end

    describe '#width' do
      it 'returns the width of block' do
        config = { unit_side: 20 }
        block = Block.new(window, config)
        expect(block.width).to eq 20
      end
    end

    describe '#draw' do
      it 'draws a rectangle' do
        config = { unit_side: 15,
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
