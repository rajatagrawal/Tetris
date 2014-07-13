require 'engine/engine'

module Tetris
  module Engine
    class Main
      include Constants

      attr_accessor :tetris_map
      attr_accessor :speed
      attr_accessor :players
      attr_accessor :rotation_handler, :movement_handler

      def initialize(config={})
        @speed = config[:speed] || 1
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @players = [Player.new, Player.new]
        @tetris_map = TetrisMap.new(@height, @width, @unit_side)
        @rotation_handler = Rotation.new(@tetris_map)
        @movement_handler = Movement.new(@tetris_map)
        @squeeze_handler = Squeeze.new(@tetris_map)
        @freeze_handler = Freeze.new(@tetris_map)
      end

      def run_game
        @players.each.with_index do |player, index|
          if player.shape == nil
            player.shape = generate_shape(Constants::Shapes.sample, index)
            player.next_shape = generate_shape(Constants::Shapes.sample, index)
          end
        end

        @players.each.with_index do |player, index|
          if @freeze_handler.can_freeze_shape? player.shape
            @freeze_handler.freeze_shape player.shape
            @squeeze_handler.rows_to_squeeze.size.times { player.increase_score(20) }
            @squeeze_handler.squeeze_rows(@squeeze_handler.rows_to_squeeze)
            if space_empty?(player.next_shape)
              player.shape = player.next_shape
              player.next_shape = generate_shape(Constants::Shapes.sample, index)
            else
              Kernel.exit
            end
          end

          @movement_handler.move_shape('down', player.shape, @players[(index + 1) % 2].shape)
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
        shape.coordinates.each do |coordinates|
          x,y = coordinates
          return false if @tetris_map.map[x][y] != 'none'
        end
        true
      end
    end
  end
end
