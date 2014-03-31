module Tetris
  module GameStrategy
    module Window
      attr_accessor :window
      attr_accessor :unit_side
      attr_accessor :height, :width
      attr_accessor :shapes, :tetris_map

      def initialize(window, config={})
        @window = window
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @shapes = []
        initialize_tetris_map
      end

      private

      def initialize_tetris_map
        @tetris_map = {}
        (1..width).each do |n|

          hsh = Hash.new do |h,k|
            h[k] = [true, Gosu::Color::NONE]
          end
          (1..height).each do |h|
            hsh[h]
          end
          @tetris_map[n] = hsh
        end
      end
    end
  end
end
