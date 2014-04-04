module Tetris
  module GameStrategy
    module TetrisMap

      def initialize_tetris_map
        @tetris_map = {}
        (1..width).each do |n|

          hsh = Hash.new do |h,k|
            h[k] = [true, Gosu::Color::NONE]
          end
          (1..height).each do |h|
            hsh[h]
          end
          @tetris_map[n] = hsh
        end
      end

      def draw_block(x,y)
        x_side = x * unit_side
        y_side = y * unit_side
        color = tetris_map[x][y][1]
        window.draw_quad(x_side, y_side, color,
                         x_side + unit_side, y_side, color,
                         x_side + unit_side, y_side + unit_side, color,
                         x_side, y_side + unit_side, color)
      end

      def draw_vertice(x,y)
        x_side = x * unit_side
        y_side = y * unit_side
        color = Gosu::Color::CYAN
        window.draw_quad(x_side, y_side, color,
                         x_side + 2, y_side, color,
                         x_side + 2, y_side + 2, color,
                         x_side, y_side + 2, color)

      end

      def draw_map
        (1..height).each do |h|
          (1..width).each do |w|
            draw_block(w,h)
            draw_vertice(w,h)
          end
        end
      end
    end
  end
end
