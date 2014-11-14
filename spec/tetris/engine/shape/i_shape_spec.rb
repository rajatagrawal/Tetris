require 'spec_helper'
require 'tetris/shape/i_shape'
module Tetris
  describe I_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures top left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = I_Shape.new(window, config)
        expect(shape.block_1.x).to eq 10
        expect(shape.block_1.y).to eq 10
        expect(shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures top right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = I_Shape.new(window, config)
        expect(shape.block_2.x).to eq 11
        expect(shape.block_2.y).to eq 10
        expect(shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures bottom left block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = I_Shape.new(window, config)
        expect(shape.block_3.x).to eq 12
        expect(shape.block_3.y).to eq 10
        expect(shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures bottom right block' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = I_Shape.new(window, config)
        expect(shape.block_4.x).to eq 13
        expect(shape.block_4.y).to eq 10
        expect(shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of shape' do
        shape = I_Shape.new window
        expect(shape.height).to eq 1
      end
    end

    describe '#width' do
      it 'returns width of shape' do
        shape = I_Shape.new window
        expect(shape.width).to eq 4
      end
    end
  end
end
