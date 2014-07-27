module Tetris
  module Engine
    class TetrisMap

      attr_accessor :unit_side
      attr_accessor :height, :width
      attr_accessor :grid

      def initialize(height, width, unit_side)
        @height = height
        @width = width
        @unit_side = unit_side
        initialize_tetris_map
      end

      def [](x,y)
        if x.nil?
          @grid[y-1]
        else
          @grid[y-1][x-1]
        end
      end

      def []=(x,y,value)
        if x.nil?
          @grid[y-1] = value
        else
          @grid[y-1][x-1] = value
        end
      end

      def has_space_for?(shape)
        shape.coordinates.all? { |x,y| empty?(x,y)  }
      end

      def empty?(x,y)
        self[x,y] == Constants::NONE
      end

      private

      def initialize_tetris_map
        @grid = Array.new(@height) do |h|
          Array.new(@width) do |w|
            Constants::NONE
          end
        end
      end
    end
  end
end
