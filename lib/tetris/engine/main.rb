require 'engine/engine'

module Tetris
  module Engine
    class Main
      include Constants

      attr_accessor :grid
      attr_accessor :speed
      attr_accessor :players
      attr_accessor :rotation, :movement

      def initialize(config={})
        assign_config config
        initializations
        initialize_handlers
        initial_shapes_for_players
      end

      def run_game
        @players.each do |player|
          @movement.move_shape(player, 'down')
          if cannot_move_further? player
            @freeze.freeze_shape player.shape
            @squeeze.squeeze_rows
            Handlers::Score.increase_score player, @squeeze.no_of_squeezed_rows

            if @grid.has_space_for? (player.next_shape)
              @shape.new_shape player
            else
              game_over
            end
          end
        end
      end

      private

      def assign_config(config)
        @speed = config[:speed] || 1
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
      end

      def initialize_handlers
        @rotation = Handlers::Rotation.new(@grid, @players)
        @movement = Handlers::Movement.new(@grid, @players)
        @freeze = Handlers::Freeze.new(@grid)
        @shape = Handlers::Shape.new(@width, @unit_side)
        @squeeze = Handlers::Squeeze.new(@grid)
      end

      def initializations
        @players = Array.new(2) { Player.new }
        @grid = TetrisMap.new(@height, @width, @unit_side)
      end

      def game_over
        raise 'fucked'
      end

      def cannot_move_further? player
        @freeze.can_freeze_shape? player.shape
      end

      def initial_shapes_for_players
        @players.map { |p| @shape.new_shape p }
      end
    end
  end
end
