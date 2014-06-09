require_relative 'squeeze'
module Tetris
  module GameStrategy
    class TetrisMap
      include Squeeze

      attr_accessor :map

      def initialize(window, height, width, unit_side)
        @window = window
        @height = height
        @width = width
        @unit_side = unit_side
        @map = {}
        @background = Gosu::Image.new(window,
                                      'assets/tetris_background.png',
                                      false)
        initialize_tetris_map
      end

      def initialize_tetris_map
        (1..@width).each do |n|
          hsh = Hash.new do |h,k|
            h[k] = [true, Gosu::Color::NONE]
          end
          (1..@height).each { |h| hsh[h] }
          @map[n] = hsh
        end

      end

      def draw_block(x,y)
        x_side = x * @unit_side
        y_side = y * @unit_side
        color = @map[x][y][1]
        @window.draw_quad(x_side, y_side, color,
                         x_side + @unit_side, y_side, color,
                         x_side + @unit_side, y_side + @unit_side, color,
                         x_side, y_side + @unit_side, color)
      end

      def draw_vertice(x,y)
        x_side = x * @unit_side
        y_side = y * @unit_side
        color = Gosu::Color::CYAN
        @window.draw_quad(x_side, y_side, color,
                         x_side + 2, y_side, color,
                         x_side + 2, y_side + 2, color,
                         x_side, y_side + 2, color)

      end

      def draw
        @background.draw(0,0,-1)
        (1..@height).each do |h|
          (1..@width).each do |w|
            draw_block(w,h)
          end
        end
        (1..(@height + 1)).each do |h|
          (1..(@width + 1)).each do |w|
            draw_vertice(w, h)
          end
        end
      end
    end
  end
end
