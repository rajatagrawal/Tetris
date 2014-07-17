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
      end

      def run_game
        @players.select do |player|
          player.shape.nil?
        end.each do |player|
          player.shape = generate_shape(Constants::Shapes.sample, player.number)
          player.next_shape = generate_shape(Constants::Shapes.sample, player.number)
        end

        @players.each do |player|
          if @freeze.can_freeze_shape? player.shape
            @freeze.freeze_shape player.shape
            num_squeezed = Squeeze.squeeze_rows(@tetris_map)
            player.increase_score(num_squeezed * 20)
            if space_empty?(player.next_shape)
              player.shape = player.next_shape
              player.next_shape = generate_shape(Constants::Shapes.sample, player.number)
            else
              raise 'fucked'
            end
          end

          other_shapes = @players.map(&:shape) - [player.shape]
          @movement.move_shape('down', player.shape, other_shapes)
        end
      end

      private

      def generate_shape(shape_class, index)
        config = { x: @width/3 + (index * @width/3),
                   unit_side: @unit_side,
                   color: Constants::ShapeColors[index] }
        shape_class.new(config)
      end

      def space_empty?(shape)
        shape.coordinates.all? { |x,y| @tetris_map[x,y] == 'none' }
      end
    end
  end
end
