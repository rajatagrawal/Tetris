require_relative 'main'
module Tetris
  module GameStrategy
    module TetrisMap

      def draw_block(x,y)
        x_side = x * unit_side
        y_side = y * unit_side
        color = tetris_map[x][y][1]
        window.draw_quad(x_side, y_side, color,
                         x_side + unit_side, y_side, color,
                         x_side + unit_side, y_side + unit_side, color,
                         x_side, y_side + unit_side, color)
      end

      def draw_map
        (1..height).each do |h|
          (1..width).each do |w|
            draw_block(w,h)
          end
        end
      end

    end
  end
end
