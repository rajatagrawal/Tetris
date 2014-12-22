require 'spec_helper'
require 'shape/l_shape'

module Tetris
  describe L_Shape do
    let(:l_shape) { L_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(l_shape.coordinates_for('0_degrees')).
          to eq([ [1,2], [2,2], [3,2], [3,1] ])
        expect(l_shape.coordinates_for('90_degrees')).
          to eq([ [1,1], [1,2], [1,3], [2,3] ])
        expect(l_shape.coordinates_for('180_degrees')).
          to eq([ [1,2], [1,1], [2,1], [3,1] ])
        expect(l_shape.coordinates_for('270_degrees')).
          to eq([ [1,1], [2,1], [2,2], [2,3] ])
      end
    end

  end
end
