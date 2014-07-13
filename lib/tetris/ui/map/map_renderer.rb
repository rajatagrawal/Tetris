require 'map/block'

module Tetris
  module UI
    module Map
      class MapRenderer

        def initialize(config={})
          assign_configuration config

          @ui_map = {}

          (1..@map.width).each do |w|
            @ui_map[w] = {}
            (1..@map.height).each do |h|
              config = { x: w * @map.unit_side,
                         y: h * @map.unit_side,
                         length: @map.unit_side}
              @ui_map[w][h] = Block.new(@canvas, config)
            end
          end
        end

        def draw_map
          draw_grid
        end

        private

        def assign_configuration(config)
          @canvas = config[:canvas]
          @map = config[:tetris_map]
        end

        def draw_grid
          height = @map.height
          width = @map.width

          (1..width).each do |w|
            (1..height).each do |h|
              @ui_map[w][h].draw(@map.map[w][h])
            end
          end
        end
      end
    end
  end
end
