module Tetris
  module Engine
    class TetrisMap

      attr_accessor :map, :unit_side
      attr_accessor :height, :width

      def initialize(height, width, unit_side)
        @height = height
        @width = width
        @unit_side = unit_side
        @map = {}
        initialize_tetris_map
      end

      private

      def initialize_tetris_map
        (1..@width).each do |n|
          hsh = Hash.new do |h,k|
            h[k] = [true, 'none']
          end
          (1..@height).each { |h| hsh[h] }
          @map[n] = hsh
        end
      end
    end
  end
end
