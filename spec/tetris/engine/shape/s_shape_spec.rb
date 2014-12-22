require 'spec_helper'
require 'shape/s_shape'

module Tetris
  describe S_Shape do
    let(:s_shape) { S_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(s_shape.coordinates_for('0_degrees')).
          to eq([ [1,2], [2,2], [2,1], [3,1] ])
        expect(s_shape.coordinates_for('90_degrees')).
          to eq([ [1,1], [1,2], [2,2], [2,3] ])
        expect(s_shape.coordinates_for('180_degrees')).
          to eq([ [1,2], [2,2], [2,1], [3,1] ])
        expect(s_shape.coordinates_for('270_degrees')).
          to eq([ [1,1], [1,2], [2,2], [2,3] ])
      end
    end
  end
end
