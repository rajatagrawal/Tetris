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
        if x.nil?
          @map[y-1]
        else
          @map[y-1][x-1]
        end
      end

      def []=(x,y,value)
        if x.nil?
          @map[y-1] = value
        else
          @map[y-1][x-1] = value
        end
      end

      private

      def initialize_tetris_map
        @map = Array.new(@height) do |h|
          Array.new(@width) do |w|
            'none'
          end
        end
      end
    end
  end
end
