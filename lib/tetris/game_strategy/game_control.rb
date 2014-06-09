module Tetris
  module GameStrategy
    module GameControl

      def generate_shape(shape_class)
        config = { x: width/2,
                   unit_side: unit_side,
                   color: Constants::ShapeColors.sample }
        shape_class.new(window, config)
      end

      def freeze_shape shape
        shape.block_coordinates.each { |x,y,color| @tetris_map.map[x][y] = [false, color] }
      end

      def run_game
        if @player.shape == nil
          @player.shape = generate_shape Constants::Shapes.sample
          @player.next_shape = generate_shape Constants::Shapes.sample
        end

        if !space_to_move?('down', @player.shape)
          freeze_shape @player.shape
          rows_to_squeeze.size.times { @player.increase_score(20) }
          squeeze_rows(rows_to_squeeze)
          if space_empty?(@player.next_shape)
            @player.shape = @player.next_shape
            @player.next_shape = generate_shape Constants::Shapes.sample
          else
            Kernel.exit
          end
        end

        move_shape('down')
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
