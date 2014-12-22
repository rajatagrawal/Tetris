require 'spec_helper'
require 'shape/complex_shape'

module Tetris
  describe ComplexShape do
    let(:initial_coordinates) { [[1,1],[1,1],[1,1],[1,2]] }
    let(:complex_shape) { ComplexShape.new }

    before do
      allow_any_instance_of(ComplexShape).to receive(:coordinates_for).
        and_return(initial_coordinates)
    end

    describe '#coordinates' do
      it 'returns the coordinates of all the blocks' do
        expect(complex_shape.coordinates).to eq initial_coordinates
      end
    end

    describe '#coordinates=' do
      it 'sets the coordinates for the the blocks' do
        coordinates = [[1,2],[3,4],[5,6],[7,8]]
        complex_shape.coordinates = coordinates
        expect(complex_shape.coordinates).to eq coordinates
      end
    end

    describe '#height' do
      it 'returns no of blocks from the top most to the bottom most block' do
        coordinates = [[1,2],[1,2],[1,3],[1,7]]
        complex_shape.coordinates = coordinates
        expect(complex_shape.height).to eq 6
      end
    end

    describe '#width' do
      it 'returns no of blocks from left to right in the shape' do
        coordinates = [[3,2],[4,2],[1,3],[5,7]]
        complex_shape.coordinates = coordinates
        expect(complex_shape.width).to eq 5
      end
    end

    describe '#move' do
      it 'calls move method on each block with specified direction' do
        complex_shape.blocks.each do |block|
          expect(block).to receive(:move).with('right')
        end
        complex_shape.move('right')
      end

      it 'increases/decreases shapes x,y appropriate to the direction' do
        expect { complex_shape.move('right') }.
          to change{ complex_shape.x }.by(1)
        expect { complex_shape.move('left') }.
          to change{ complex_shape.x }.by(-1)
        expect { complex_shape.move('up') }.
          to change{ complex_shape.y }.by(-1)
        expect { complex_shape.move('down') }.
          to change{ complex_shape.y }.by(1)
      end
    end

    describe '#next_orientation' do
      it 'gets the next orientation' do
        expect(complex_shape.next_orientation).to eq '90_degrees'
        complex_shape.orientation = '270_degrees'
        expect(complex_shape.next_orientation).to eq '0_degrees'
      end
    end

    describe '#rotate' do
      it 'changes the orientation of the shape' do
        expect(complex_shape.orientation).to eq '0_degrees'
        complex_shape.rotate
        expect(complex_shape.orientation).to eq '90_degrees'
      end

      it 'sets appropriate block coordinates' do
        coordinates = [[1,2],[3,4],[5,6],[7,8]]
        allow(complex_shape).to receive(:coordinates_for).
          with('90_degrees').and_return(coordinates)
        expect(complex_shape.orientation).to eq ('0_degrees')
        complex_shape.rotate
        expect(complex_shape.coordinates).to eq coordinates
      end
    end
  end
end
