require_relative 'squeeze'
module Tetris
  module Engine
    class TetrisMap
      include Squeeze

      attr_accessor :map, :height, :width, :unit_side

      def initialize(window, height, width, unit_side)
        @window = window
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
            h[k] = [true, Gosu::Color::NONE]
          end
          (1..@height).each { |h| hsh[h] }
          @map[n] = hsh
        end

      end
    end
  end
end
