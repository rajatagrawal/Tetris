require_relative 'engine'
module Tetris
  module Engine
    class Main
      include Constants

      attr_accessor :window, :tetris_map
      attr_accessor :width, :height
      attr_accessor :shape, :unit_side
      attr_accessor :speed
      attr_accessor :player
      attr_accessor :rotation_handler, :movement_handler

      def initialize(config={})
        @window = config[:window]
        @speed = config[:speed] || 1
        @unit_side = config[:unit_side] || 10
        @width = config[:width] || 10
        @height = config[:height] || 10
        @player = Player.new
        @tetris_map = TetrisMap.new(@height, @width, @unit_side)
        @rotation_handler = Rotation.new(@tetris_map, @height, @width)
        @movement_handler = Movement.new(@tetris_map, @height, @width)
        @squeeze_handler = Squeeze.new(@tetris_map)
      end

      def run_game
        if @player.shape == nil
          @player.shape = generate_shape Constants::Shapes.sample
          @player.next_shape = generate_shape Constants::Shapes.sample
        end

        if !@movement_handler.space_to_move?('down', @player.shape)
          freeze_shape @player.shape
          @squeeze_handler.rows_to_squeeze.size.times { @player.increase_score(20) }
          @squeeze_handler.squeeze_rows(@squeeze_handler.rows_to_squeeze)
          if space_empty?(@player.next_shape)
            @player.shape = @player.next_shape
            @player.next_shape = generate_shape Constants::Shapes.sample
          else
            Kernel.exit
          end
        end

        @movement_handler.move_shape('down', @player.shape)
      end

      private

      def generate_shape(shape_class)
        config = { x: width/2,
                   unit_side: unit_side,
                   color: Constants::ShapeColors.sample }
        shape_class.new(config)
      end

      def freeze_shape shape
        shape.block_coordinates.each { |x,y,color| @tetris_map.map[x][y] = [false, color] }
      end


      def space_empty?(shape)
        shape.block_coordinates.each do |coordinates|
          x,y = coordinates
          return false if @tetris_map.map[x][y][0] == false
        end
        true
      end
    end
  end
end
