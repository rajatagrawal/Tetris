module Tetris
  module Engine
    class ShapeGenerator

      def initialize(width, unit_side)
        @width = width
        @unit_side = unit_side
      end

      def generate_shape(player)
        if player.shape.nil?
          player.shape = new_shape(player)
        else
          player.shape = player.next_shape
        end

        player.next_shape = new_shape player
      end

      private

      def new_shape(player)
        config = { x: position(player.number),
                   unit_side: @unit_side,
                   color: player.color }

        Constants::Shapes.sample.new(config)
      end

      def position(number)
        @width/3 + (number * @width/3)
      end
    end
  end
end
