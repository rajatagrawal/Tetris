require 'engine/engine'

module Tetris
  module Engine
    class Main
      include Constants

      attr_accessor :tetris_map
      attr_accessor :speed
      attr_accessor :players
      attr_accessor :rotation, :movement

      def initialize(config={})
        @speed = config[:speed] || 1
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @players = [Player.new, Player.new]
        @tetris_map = TetrisMap.new(@height, @width, @unit_side)
        @rotation = Rotation.new(@tetris_map)
        @movement = Movement.new(@tetris_map)
        @freeze = Freeze.new(@tetris_map)
        @shape_generator = ShapeGenerator.new(@width, @unit_side)
      end

      def run_game
        @players.select do |player|
          player.shape.nil?
        end.each do |player|
          @shape_generator.generate_shape player
        end

        @players.each do |player|
          if @freeze.can_freeze_shape? player.shape
            @freeze.freeze_shape player.shape
            num_squeezed = Squeeze.squeeze_rows(@tetris_map)
            player.increase_score(num_squeezed * 20)
            if @tetris_map.space_for? (player.next_shape)
              @shape_generator.generate_shape player
            else
              raise 'fucked'
            end
          end

          other_shapes = @players.map(&:shape) - [player.shape]
          @movement.move_shape('down', player.shape, other_shapes)
        end
      end
    end
  end
end
