require 'spec_helper'
require 'tetris/shape'

module Tetris
  describe Shape do

    it 'stores the coordinates of the shape' do
      window = double 'window'
      shape = Shape.new(window, 5,6)
      expect(shape.x).to eq 5
      expect(shape.y).to eq 6
    end

    it 'assigns default coordinates to the shape' do
      window = double 'window'
      shape = Shape.new window
      expect(shape.x).to eq 0
      expect(shape.y).to eq 0
    end

    it 'assigns color to the shape' do
      window = double 'window'
      shape = Shape.new(window, 0,0,'red')
      expect(shape.color).to eq 'red'
    end

    it 'assigns default color to the shape' do
      window = double 'window'
      shape = Shape.new window
      expect(shape.color).to eq Gosu::Color::RED
    end
  end
end
