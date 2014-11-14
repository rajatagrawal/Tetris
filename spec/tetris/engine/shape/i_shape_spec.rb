require 'tetris/engine/shape/i_shape'

module Tetris
  describe I_Shape do
    let(:i_shape) { I_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(i_shape.coordinates_for('0_degrees')).
          to eq([ [1,1], [2,1], [3,1], [4,1] ])
        expect(i_shape.coordinates_for('90_degrees')).
          to eq([ [2,0], [2,1], [2,2], [2,3] ])
        expect(i_shape.coordinates_for('180_degrees')).
          to eq([ [1,1], [2,1], [3,1], [4,1] ])
        expect(i_shape.coordinates_for('270_degrees')).
          to eq([ [2,0], [2,1], [2,2], [2,3] ])
      end
    end
  end
end
