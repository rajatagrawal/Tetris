require 'tetris/engine/tetris_map'

module Tetris
  module Engine
    describe TetrisMap do
      let(:tetris_map) { TetrisMap.new(3,3,20) }

      describe '#[]' do
        it 'retuns the color at x,y in the map' do
          tetris_map.grid[2][1] = 'red'
          expect(tetris_map[2,3]).to eq 'red'
          (1..3).each do |h|
            (1..3).each do |w|
              next if w == 2 && h == 3
              expect(tetris_map[w,h]).to eq 'none'
            end
          end
        end

        it 'returns the whole row of color if x coordinate is missing' do
          colors = ['red','blue','green']
          tetris_map.grid[2] = colors
          expect(tetris_map[3]).to eq colors
        end
      end

      describe '#[]=' do
        it 'sets the color at x,y in the map' do
          tetris_map[2,3] = 'red'
          expect(tetris_map[2,3]).to eq 'red'
        end

        it 'sets the whole row of colors when x is missing' do
          colors = ['green','green','red']
          tetris_map[3] = colors
          expect(tetris_map[3]).to eq colors
        end
      end

      describe '#has_space_for?' do
        let(:shape) { double(:shape,
                             coordinates: [[1,1],[1,1],[1,1],[1,1]]) }

        it 'returns true if color at shape coordinates is none in map' do
          expect(tetris_map.has_space_for?(shape)).to eq true
        end

        it 'returns false if color at any of the shape coordinates is not none' do
          tetris_map[1,1] = 'red'
          expect(tetris_map.has_space_for?(shape)).to eq false
        end
      end

      describe '#empty?' do
        it 'returns true if color at x,y is none' do
          expect(tetris_map.empty?(1,1)).to eq true
        end

        it 'returns false if color at x,y is not none' do
          tetris_map[1,1] = 'red'
          expect(tetris_map.empty?(1,1)).to eq false
        end
      end

    end
  end
end
