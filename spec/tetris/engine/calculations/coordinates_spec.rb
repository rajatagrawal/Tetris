require 'tetris/engine/calculations/coordinates'

module Tetris
  module Engine
    module Calculations
      describe Coordinates do
        let(:coordinates_calculator) { Coordinates.new }

        describe '#coordinates_for' do
          it 'returns to be coordinates for shape if it were to move' do
            shape = double(:shape, coordinates: [[1,1],[1,1],[1,1],[1,1]])

            coordinates = coordinates_calculator.coordinates_for(shape,'right')
            expect(coordinates).to eq ([[2,1],[2,1],[2,1],[2,1]])

            coordinates = coordinates_calculator.coordinates_for(shape,'left')
            expect(coordinates).to eq ([[0,1],[0,1],[0,1],[0,1]])

            coordinates = coordinates_calculator.coordinates_for(shape,'up')
            expect(coordinates).to eq ([[1,0],[1,0],[1,0],[1,0]])

            coordinates = coordinates_calculator.coordinates_for(shape,'down')
            expect(coordinates).to eq ([[1,2],[1,2],[1,2],[1,2]])
          end
        end

        describe '#other_shapes_coordinates' do
          it 'returns the coordinates of other shapes than current one' do
            shape_1_coordinates = double(:shape_1_coordinates)
            shape_2_coordinates = double(:shape_2_coordinates)
            shape_3_coordinates = double(:shape_3_coordinates)
            shape1 = double(:shape, coordinates: shape_1_coordinates)
            shape2 = double(:shape, coordinates: shape_2_coordinates)
            shape3 = double(:shape, coordinates: shape_3_coordinates)

            coordinates = coordinates_calculator.
              other_shapes_coordinates(shape1,[shape1, shape2, shape3])
            expect(coordinates).to match_array([shape_2_coordinates,
                                                shape_3_coordinates])
          end
        end
      end
    end
  end
end
