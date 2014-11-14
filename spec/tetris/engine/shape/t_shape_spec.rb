require 'spec_helper'
require 'tetris/shape/t_shape'
module Tetris
  describe T_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_1.x).to eq 10
        expect(t_shape.block_1.y).to eq 11
        expect(t_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_2.x).to eq 11
        expect(t_shape.block_2.y).to eq 11
        expect(t_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_3.x).to eq 11
        expect(t_shape.block_3.y).to eq 10
        expect(t_shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_4.x).to eq 12
        expect(t_shape.block_4.y).to eq 11
        expect(t_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of t_shape' do
        t_shape = T_Shape.new window
        expect(t_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of t_shape' do
        t_shape = T_Shape.new window
        expect(t_shape.width).to eq 3
      end
    end
  end
end
