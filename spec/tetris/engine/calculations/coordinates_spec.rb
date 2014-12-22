require 'spec_helper'
require 'calculations/coordinates'

module Tetris
  module Engine
    module Calculations
      describe Coordinates do
        let(:xy_calculator) { Coordinates.new }

        describe '#xy_for' do
          it 'returns to be coordinates for shape if it were to move' do
            shape = double(:shape, coordinates: [[1,1],[1,1],[1,1],[1,1]])

            coordinates = xy_calculator.xy_for(shape,'right')
            expect(coordinates).to eq ([[2,1],[2,1],[2,1],[2,1]])

            coordinates = xy_calculator.xy_for(shape,'left')
            expect(coordinates).to eq ([[0,1],[0,1],[0,1],[0,1]])

            coordinates = xy_calculator.xy_for(shape,'up')
            expect(coordinates).to eq ([[1,0],[1,0],[1,0],[1,0]])

            coordinates = xy_calculator.xy_for(shape,'down')
            expect(coordinates).to eq ([[1,2],[1,2],[1,2],[1,2]])
          end
        end

        describe '#other_shapes_xy' do
          it 'returns the coordinates of other shapes than current one' do
            shape_1_xy = double(:shape_1_xy)
            shape_2_xy = double(:shape_2_xy)
            shape_3_xy = double(:shape_3_xy)
            shape1 = double(:shape, coordinates: shape_1_xy)
            shape2 = double(:shape, coordinates: shape_2_xy)
            shape3 = double(:shape, coordinates: shape_3_xy)

            xy = xy_calculator.other_shapes_xy(shape1,[shape1, shape2, shape3])
            expect(xy).to match_array([shape_2_xy, shape_3_xy])
          end
        end

        describe '#rotated_xy_for' do
          it 'returns shape coordinates for next rotation' do
            shape = double(:shape, next_orientation: '90_degrees')
            coordinates = double
            allow(shape).to receive(:coordinates_for).with('90_degrees').
              and_return(coordinates)

            rotation_xy = xy_calculator.rotated_xy_for(shape)
            expect(rotation_xy).to eq coordinates
          end
        end
      end
    end
  end
end
