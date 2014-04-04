# require_relative 'window'
# require_relative 'movement'
# require_relative 'game_control'
# require_relative 'squeeze'
require_relative 'tetris_map'

module Tetris
  module GameStrategy
    class Main
      include TetrisMap

      attr_accessor :window, :tetris_map
      attr_accessor :width, :height
      attr_accessor :shapes, :unit_side

      def initialize(window, config={})
        @window = window
        @shapes = []
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        initialize_tetris_map
      end
    end
  end
end
