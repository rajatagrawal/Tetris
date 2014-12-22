require 'spec_helper'
require 'shape/t_shape'

module Tetris
  describe T_Shape do
    let(:t_shape) { T_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(t_shape.coordinates_for('0_degrees')).
          to eq([ [1,2], [2,2], [2,1], [3,2] ])
        expect(t_shape.coordinates_for('90_degrees')).
          to eq([ [2,1], [2,2], [2,3], [3,2] ])
        expect(t_shape.coordinates_for('180_degrees')).
          to eq([ [1,2], [2,2], [3,2], [2,3] ])
        expect(t_shape.coordinates_for('270_degrees')).
          to eq([ [2,1], [2,2], [2,3], [1,2] ])
      end
    end
  end
end
