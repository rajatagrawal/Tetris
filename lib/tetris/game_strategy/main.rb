require_relative '../shape/square'
require_relative '../shape/block'
require_relative 'tetris_map'
require_relative 'movement'
require_relative 'squeeze'
require_relative 'game_control'

module Tetris
  module GameStrategy
    class Main
      include TetrisMap
      include Movement
      include Squeeze
      include GameControl

      attr_accessor :window, :tetris_map
      attr_accessor :width, :height
      attr_accessor :shape, :unit_side
      attr_accessor :speed, :score

      def initialize(window, config={})
        @window = window
        @speed = config[:speed] || 1
        @score = 0
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        initialize_tetris_map
      end
    end
  end
end
