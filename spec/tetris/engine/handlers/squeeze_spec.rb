require 'spec_helper'
require 'handlers/squeeze'
require 'tetris_map'

module Tetris
  module Engine
    module Handlers
      describe Squeeze do

        describe '#squeeze_rows' do
          let(:tetris_map) { TetrisMap.new(2,2,35) }

          it 'squeezes all the filled rows in a tetris map' do
            tetris_map[1] = ['red','red']
            squeezer = Squeeze.new(tetris_map)
            squeezer.squeeze_rows
            expect(tetris_map[1]).to eq ['none', 'none']
          end

          it 'drops the top rows down' do
            tetris_map[1] = ['none', 'red']
            tetris_map[2] = ['red','red']
            squeezer = Squeeze.new(tetris_map)
            squeezer.squeeze_rows
            expect(tetris_map[1]).to eq ['none','none']
            expect(tetris_map[2]).to eq ['none','red']
          end
        end
      end
    end
  end
end
