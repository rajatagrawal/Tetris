require 'spec_helper'
require 'tetris/shape/s_shape'
module Tetris
  describe S_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.block_1.x).to eq 10
        expect(s_shape.block_1.y).to eq 11
        expect(s_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.block_2.x).to eq 11
        expect(s_shape.block_2.y).to eq 11
        expect(s_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.block_3.x).to eq 11
        expect(s_shape.block_3.y).to eq 10
        expect(s_shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        s_shape = S_Shape.new(window, config)
        expect(s_shape.block_4.x).to eq 12
        expect(s_shape.block_4.y).to eq 10
        expect(s_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of s_shape' do
        s_shape = S_Shape.new window
        expect(s_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of s_shape' do
        s_shape = S_Shape.new window
        expect(s_shape.width).to eq 3
      end
    end
  end
end
