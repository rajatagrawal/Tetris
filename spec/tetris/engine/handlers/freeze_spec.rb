require 'spec_helper'
require 'handlers/freeze'
require 'tetris_map'

module Tetris
  module Engine
    module Handlers
      describe Freeze do

        describe '#freeze_shape' do
          it 'sets color values equal to shape color at shape coordinates in the map' do
            coordinates = [[1,1],[1,2],[1,3,],[2,1]]
            shape = double(:shape, coordinates: coordinates, color: 'red')
            tetris_map = TetrisMap.new(3,3,20)
            freezer = Freeze.new(tetris_map)

            expect(tetris_map[1,1]).to eq 'none'
            expect(tetris_map[1,2]).to eq 'none'
            expect(tetris_map[1,3]).to eq 'none'
            expect(tetris_map[2,1]).to eq 'none'

            freezer.freeze_shape(shape)

            expect(tetris_map[1,1]).to eq 'red'
            expect(tetris_map[1,2]).to eq 'red'
            expect(tetris_map[1,3]).to eq 'red'
            expect(tetris_map[2,1]).to eq 'red'
          end
        end
      end
    end
  end
end
