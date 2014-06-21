require_relative 'color_parser'
module Tetris
  module UI
    class MapRenderer

      def initialize(config={})
        assign_configuration config
        background_image_path = 'assets/tetris_background.png'
        @background = Gosu::Image.new(@canvas,
                                      background_image_path,
                                      false)
      end

      def draw_map
        draw_map_background
        draw_grid
      end

      private

      def assign_configuration(config)
        @canvas = config[:canvas]
        @map = config[:tetris_map]
      end

      def draw_map_background
        @background.draw(0,0,-1)
      end

      def draw_grid_block(map_x,map_y)
        side = @map.unit_side
        x = map_x * side
        y = map_y * side
        color = ColorParser.parse_color @map.map[map_x][map_y][1]
        @canvas.draw_quad(x,y,color,
                          x+side, y, color,
                          x+side, y+side, color,
                          x, y+side, color)
      end

      def draw_grid
        height = @map.height
        width = @map.width

        (1..height).each do |h|
          (1..width).each do |w|
            draw_grid_block(w,h)
          end
        end
      end
    end
  end
end
