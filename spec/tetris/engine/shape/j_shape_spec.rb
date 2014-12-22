require 'spec_helper'
require 'shape/j_shape'

module Tetris
  describe J_Shape do
    let(:j_shape) { J_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(j_shape.coordinates_for('0_degrees')).
          to eq([ [1,1], [1,2], [2,2], [3,2] ])
        expect(j_shape.coordinates_for('90_degrees')).
          to eq([ [2,1], [1,1], [1,2], [1,3] ])
        expect(j_shape.coordinates_for('180_degrees')).
          to eq([ [3,2], [3,1], [2,1], [1,1] ])
        expect(j_shape.coordinates_for('270_degrees')).
          to eq([ [1,3], [2,3], [2,2], [2,1] ])
      end
    end
  end
end
