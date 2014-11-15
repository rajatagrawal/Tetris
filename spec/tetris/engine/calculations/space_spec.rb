require 'tetris/engine/calculations/space'
require 'tetris/engine/tetris_map'

module Tetris
  module Engine
    module Calculations
      describe Space do
        let(:tetris_map) { TetrisMap.new(3,3,20) }
        let(:space_calculator) { Space.new(tetris_map) }

        describe '#coordinates_in_bounds?' do
          it 'returns true if the all the coordinates are in map bounds' do
            coordinates = [[1,1],[2,2],[1,1],[1,3]]
            expect(space_calculator.coordinates_in_bounds?(coordinates)).to eq true
          end

          it 'returns false if the shape is not in map bounds' do
            coordinates = [[1,1],[2,2],[1,1],[1,5]]
            expect(space_calculator.coordinates_in_bounds?(coordinates)).to eq false
          end
        end

        describe '#collides_with_other_shape?' do
          it 'returns true if coordinates has overlapping with other shape' do
            coordinates = [[1,1],[2,2],[1,1],[1,3]]
            other_coordinates = [[1,1],[5,2],[5,1],[5,3]]

            collision = space_calculator.collides_with_other_shape?(coordinates,
                                                                    other_coordinates)
            expect(collision).to eq true
          end

          it 'returns false if coordinates are not overlapping with other shape' do
            coordinates = [[1,1],[2,2],[1,1],[1,3]]
            other_coordinates = [[4,1],[5,2],[5,1],[5,3]]

            collision = space_calculator.collides_with_other_shape?(coordinates,
                                                                    other_coordinates)
            expect(collision).to eq false
          end
        end

        describe '#space_in_map?' do
          it 'returns true if all of coordinates have none value in map' do
            coordinates = [[1,1],[1,2],[3,2],[3,3]]
            expect(space_calculator.space_in_map?(coordinates)).to eq true
          end

          it 'returns false if any of the coordinates does not have none value in map' do
            coordinates = [[1,1],[1,2],[3,2],[3,3]]
            tetris_map = TetrisMap.new(3,3,20)
            tetris_map[1,1] = 'red'
            space_calculator = Space.new(tetris_map)
            expect(space_calculator.space_in_map?(coordinates)).to eq false
          end
        end
      end
    end
  end
end
