module Tetris
  module Engine
    class TetrisMap

      attr_accessor :unit_side
      attr_accessor :height, :width

      def initialize(height, width, unit_side)
        @height = height
        @width = width
        @unit_side = unit_side
        initialize_tetris_map
      end

      def [](x,y)
        @map[x-1][y-1]
      end

      def []=(x,y,color)
        @map[x-1][y-1] = color
      end

      private

      def initialize_tetris_map
        @map = Array.new(@width) do |index|
          Array.new(@height) do |height_index|
            'none'
          end
        end
      end
    end
  end
end
