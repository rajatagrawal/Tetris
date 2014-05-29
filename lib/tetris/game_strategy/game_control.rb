module Tetris
  module GameStrategy
    module GameControl

      def generate_shape
        shape_class = Constants::Shapes.sample
        config = { x: width/2,
                   unit_side: unit_side,
                   color: Constants::ShapeColors.sample }
        shape = shape_class.new(window, config)
        if space_empty?(shape)
          @shape = shape
        else
          Kernel.exit
        end
      end

      def freeze_shape shape
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]
          color = coordinate[2]
          tetris_map[x][y] = [false, color]
        end
      end

      def run_game
        if shape == nil
          generate_shape
        end

        if !space_to_move?('down', shape)
          freeze_shape shape
          rows_to_squeeze.size.times { increase_score(20) }
          squeeze_rows(rows_to_squeeze)
          generate_shape
        end

        move_shape('down')
      end

      def space_empty?(shape)
        shape.block_coordinates.each do |coordinate|
          x = coordinate[0]
          y = coordinate[1]
          return false if tetris_map[x][y][0] == false
        end
        true
      end
    end
  end
end
