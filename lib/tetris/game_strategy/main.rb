require_relative 'game_strategy'
module Tetris
  module GameStrategy
    class Main
      include Constants
      include Score
      include GameControl

      attr_accessor :window, :tetris_map
      attr_accessor :width, :height
      attr_accessor :shape, :unit_side
      attr_accessor :speed, :score
      attr_accessor :score_font
      attr_accessor :player
      attr_accessor :rotation_handler, :movement_handler

      def initialize(window, config={})
        @window = window
        @speed = config[:speed] || 1
        @score = 0
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @score_font = Gosu::Font.new(window, 'Arial', 30)
        @player = Player.new
        @tetris_map = TetrisMap.new(window,
                                    @height,
                                    @width,
                                    @unit_side)
        @rotation_handler = Rotation.new(@tetris_map, @height, @width)
        @movement_handler = Movement.new(@tetris_map, @height, @width)
      end
    end
  end
end
