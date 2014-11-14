require 'spec_helper'
require 'tetris/shape/o_shape'
module Tetris
  describe O_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = O_Shape.new(window, config)
        expect(shape.block_1.x).to eq 10
        expect(shape.block_1.y).to eq 10
        expect(shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = O_Shape.new(window, config)
        expect(shape.block_2.x).to eq 11
        expect(shape.block_2.y).to eq 10
        expect(shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = O_Shape.new(window, config)
        expect(shape.block_3.x).to eq 10
        expect(shape.block_3.y).to eq 11
        expect(shape.block_3.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        shape = O_Shape.new(window, config)
        expect(shape.block_4.x).to eq 11
        expect(shape.block_4.y).to eq 11
        expect(shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of shape' do
        shape = O_Shape.new window
        expect(shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of shape' do
        shape = O_Shape.new window
        expect(shape.width).to eq 2
      end
    end
  end
end
