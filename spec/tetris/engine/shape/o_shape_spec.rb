require 'tetris/engine/shape/o_shape'
module Tetris
  describe O_Shape do
    let(:o_shape) { O_Shape.new }

    describe '#coordinates_for' do
      it 'returns correct coordinates for the forming blocks' do
        expect(o_shape.coordinates_for('0_degrees')).
          to eq([ [1,1], [2,1], [2,2], [1,2] ])
        expect(o_shape.coordinates_for('90_degrees')).
          to eq([ [1,1], [2,1], [2,2], [1,2] ])
        expect(o_shape.coordinates_for('180_degrees')).
          to eq([ [1,1], [2,1], [2,2], [1,2] ])
        expect(o_shape.coordinates_for('270_degrees')).
          to eq([ [1,1], [2,1], [2,2], [1,2] ])
      end
    end
  end
end
