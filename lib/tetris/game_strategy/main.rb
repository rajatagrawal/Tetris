require_relative '../shape/square'
require_relative '../shape/block'
require_relative '../shape/s_shape'
require_relative '../shape/z_shape'
require_relative '../shape/i_shape'
require_relative '../shape/j_shape'
require_relative '../shape/l_shape'
require_relative 'tetris_map'
require_relative 'movement'
require_relative 'squeeze'
require_relative 'score'
require_relative 'game_control'

module Tetris
  module GameStrategy
    class Main
      include TetrisMap
      include Movement
      include Squeeze
      include Score
      include GameControl

      attr_accessor :window, :tetris_map
      attr_accessor :width, :height
      attr_accessor :shape, :unit_side
      attr_accessor :speed, :score
      attr_accessor :score_font

      def initialize(window, config={})
        @window = window
        @speed = config[:speed] || 1
        @score = 0
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @score_font = Gosu::Font.new(window, 'Arial', 30)
        initialize_tetris_map
      end
    end
  end
end
