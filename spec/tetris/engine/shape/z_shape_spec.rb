require 'tetris/engine/shape/z_shape'
module Tetris
  describe Z_Shape do
    let(:z_shape) { Z_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(z_shape.coordinates_for('0_degrees')).
          to eq([ [1,1], [2,1], [2,2], [3,2] ])
        expect(z_shape.coordinates_for('90_degrees')).
          to eq([ [2,1], [2,2], [1,2], [1,3] ])
        expect(z_shape.coordinates_for('180_degrees')).
          to eq([ [1,1], [2,1], [2,2], [3,2] ])
        expect(z_shape.coordinates_for('270_degrees')).
          to eq([ [2,1], [2,2], [1,2], [1,3] ])
      end
    end
  end
end
